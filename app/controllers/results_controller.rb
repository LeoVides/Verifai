class ResultsController < ApplicationController
  def history
    @results = current_user.results
  end
end
