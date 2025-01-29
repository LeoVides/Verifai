require 'tf-idf-similarity'
require 'matrix'
require 'json'

class ResultsController < ApplicationController

  def history
    @results = current_user.results

    if params[:query].present?
      sql_subquery = "title  ILIKE :query OR user_input ILIKE :query OR fact_score ILIKE :query OR political_bias ILIKE :query"
      @results = @results.where(sql_subquery, query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("history-results", partial: "history_results", locals: { results: @results }) }
      format.html # Needed for normal page load
    end
  end

  def search
    @result = Result.new
  end

  def show
    @result = Result.find(params[:id])
  end

  def create
    @result = Result.new(result_params)
    @result.user = current_user

    # Prompt to ChatGPT to get the political bias and fact score
    prompt =  <<~TEXT
      Based on this news excerpt: #{@result.user_input}.
      Return the political_bias of the text (choose  only one between: Far-left, Left, Center, Right, Far-right),
      the fact_score (choose only one between: Very low, Low, Medium, High, Very high)
      and a title summarizing the key point of the news excerpt (maximum 5 words).
      Provide your response in JSON format with keys 'political_bias’, 'fact_score'  and ‘title’
      and use the Media Bias/Fact Check (MBFC) methodology.
    TEXT
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: prompt}]
    })

    # Extract the response from ChatGPT and clean it to parse the JSON
    @response = chatgpt_response["choices"][0]["message"]["content"]
    @clean_response = @response.gsub(/```json\n|```/, '')
    @result.political_bias = JSON.parse(@clean_response)["political_bias"]
    @result.fact_score = JSON.parse(@clean_response)["fact_score"]
    @result.title= JSON.parse(@clean_response)["title"]

    if @result.save
      render json: { user_input: @result.user_input, political_bias: @result.fact_score, fact_score: @result.fact_score, title: @result.title, message: "Result saved successfully" }
    else
      render json: { errors: @result.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { errors: ["Something went wrong: #{e.message}"] }, status: :internal_server_error
  end

  def hot_topics
    @results = Result.all

    @user_inputs = @results.map { |result| result.user_input}

    corpus = @user_inputs.map { |text| TfIdfSimilarity::Document.new(text) }
    model = TfIdfSimilarity::TfIdfModel.new(corpus)

    # Get the similarity matrix
    similarity_matrix = model.similarity_matrix
    # Define similarity threshold
    similarity_threshold = 0.30

    # Create a hash to store grouped inputs
    @groups = Hash.new { |hash, key| hash[key] = [] }

    # Group inputs based on similarity
    corpus.each_with_index do |doc, i|
        # Check if the document is similar to an existing group
      key = @groups.keys.find do |key_doc|
        j = corpus.index(key_doc)
        similarity_matrix[i, j] > similarity_threshold
      end

      if key
        @groups[key] << @user_inputs[i]
      else
        @groups[doc] = [@user_inputs[i]]
      end
    end
    @groups = @groups.sort_by { |_key, values| -values.size }.to_h
  end

  private

  def result_params
    params.require(:result).permit(:user_input)
  end
end
