class CreateMediaResults < ActiveRecord::Migration[7.1]
  def change
    create_table :media_results do |t|
      t.references :result, null: false, foreign_key: true
      t.references :media, null: false, foreign_key: true

      t.timestamps
    end
  end
end
