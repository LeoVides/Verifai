require 'tf-idf-similarity'
require 'matrix'
require 'json'

class ResultsController < ApplicationController

  def history
    @results = current_user.results.order(created_at: :desc)

    if params[:query].present?
      sql_subquery = "title  ILIKE :query OR user_input ILIKE :query OR fact_score ILIKE :query OR political_bias ILIKE :query"
      @results = @results.where(sql_subquery, query: "%#{params[:query]}%").order(created_at: :desc)
    end

    # To get the results grouped by date
    @grouped_results = @results.group_by do |result|
      if result.created_at.to_date == Date.today
        "Today"
      elsif result.created_at >= 1.days.ago
        "Yesterday"
      elsif result.created_at >= 7.days.ago
        "Last 7 Days"
      elsif result.created_at >= 30.days.ago
        "Last 30 Days"
      else
        result.created_at.strftime("%B %d, %Y") # Format as "January 28, 2025"
      end
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("history-results", partial: "history_results", locals: { grouped_results: @grouped_results }) }
      format.html # Needed for normal page load
    end
  end

  def search
    @result = Result.new
  end

  def show
    @result = Result.find(params[:id])
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    redirect_to root_path, status: :see_other, notice: "Result was successfully deleted."
  end

  def create

    @result = OpenAiCallJob.perform_later(result_params, current_user)

    respond_to do |format|
      format.json { render json: { message: "Processing started", user_input: result_params[:user_input] } }
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(:results, partial: "results/result",
          locals: { result: @result })
      end
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
