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

  private

  def result_params
    params.require(:result).permit(:user_input)
  end
end
