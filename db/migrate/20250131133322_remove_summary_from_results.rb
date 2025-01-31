class RemoveSummaryFromResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :results, :summary, :text
  end
end
