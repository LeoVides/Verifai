class AddCheckerScoreToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :checker_score, :integer, default: 0
  end
end
