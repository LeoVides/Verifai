require 'tf-idf-similarity'
require 'matrix'

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
      messages: [{ role: "user", content: "Give me the political bias of this text: #{@result.user_input}, where political bias can be one of the following options: far-left, left, centre, right, far-right. And choose only one word, amongst these." }]
    })
    @political_bias = chatgpt_response["choices"][0]["message"]["content"]

    if @result.save
      render json: { user_input: @result.user_input, political_bias: @political_bias, message: "Result saved successfully" }
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
