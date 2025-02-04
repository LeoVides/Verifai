class PagesController < ApplicationController
  def home
  end

  def insights
    all_political_biases = { "Left" => 0, "Far-left" => 0, "Center" => 0, "Right" => 0, "Far-right" => 0 }
    all_credibility_scores = { "Very low" => 0, "Low" => 0, "Medium" => 0, "High" => 0, "Very high" => 0 }

    # Merge real counts into the default categories (so missing ones stay at 0)
     @user_political_bias_counts = all_political_biases.merge(Result.where(user: current_user).group(:political_bias).count)
    @political_bias_counts = all_political_biases.merge(Result.group(:political_bias).count)

    @user_credibility_counts = all_credibility_scores.merge(Result.where(user: current_user).group(:fact_score).count)
    @credibility_counts = all_credibility_scores.merge(Result.group(:fact_score).count)
  end
end
