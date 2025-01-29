class RemovePoliticalBiasConfidenceFromResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :results, :political_bias_confidence, :float
  end
end
