class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code, null: false
      t.integer    :sender_id, null: false
      t.string     :city,      null: false, foreign_key: true
      t.string     :street,    null: false, foreign_key: true
      t.string     :building
      t.string     :telephone, null: false, foreign_key: true
      t.references :buy,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
