class RemoveFactScoreConfidenceFromResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :results, :fact_score_confidence, :float
  end
end
