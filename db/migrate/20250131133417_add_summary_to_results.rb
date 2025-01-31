class AddSummaryToResults < ActiveRecord::Migration[7.1]
  def change
    add_column :results, :summary, :text
  end
end
