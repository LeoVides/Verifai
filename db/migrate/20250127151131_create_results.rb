class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :fact_score
      t.string :political_bias
      t.string :source_media
      t.text :user_input
      t.float :political_bias_confidence
      t.float :fact_score_confidence
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
