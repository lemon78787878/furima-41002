class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item,          null: false
      t.text :description,     null: false
      t.integer :category_id,  null: false
      t.integer :condition_id, null: false
      t.integer :post_cost_id, null: false
      t.integer :sender_id,    null: false
      t.integer :ship_date_id, null: false
      t.integer :price,        null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
