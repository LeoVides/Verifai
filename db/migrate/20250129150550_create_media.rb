class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.string :name
      t.string :url
      t.string :political_bias
      t.string :logo_url

      t.timestamps
    end
  end
end
