class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :label
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
