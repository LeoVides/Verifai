require 'tf-idf-similarity'
require 'matrix'
require 'json'

class ResultsController < ApplicationController

  def history
    @results = current_user.results
  end

  def search
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.user = current_user

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Based on this news excerpt: #{@result.user_input}.  Return the political_bias of the text (choose  only one between: Far-left, Left, Centre, rRght, Far-right) and the fact_score (choose only one between: Very low, Low, Medium, High, Very high). Provide your response in JSON format with keys 'political_bias' and 'fact_score' and use the Media Bias/Fact Check (MBFC) methodology." }]
    })
    @response = chatgpt_response["choices"][0]["message"]["content"]
    @clean_response = @response.gsub(/```json\n|```/, '')

    @result.political_bias = JSON.parse(@clean_response)["political_bias"]
    @result.fact_score = JSON.parse(@clean_response)["fact_score"]

    if @result.save
      render json: { user_input: @result.user_input, political_bias: @result.fact_score, fact_score: @result.fact_score,  message: "Result saved successfully" }
    else
      render json: { errors: @result.errors.full_messages }, status: :unprocessable_entity
    end
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
