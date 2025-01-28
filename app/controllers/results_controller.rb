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

    if @result.save
      render json: { user_input: @result.user_input, message: "Result saved successfully" }
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
