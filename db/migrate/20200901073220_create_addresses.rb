class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,              null: false
      t.integer :prefecture_id,        null: false
      t.string :city,                  null: false
      t.string :address,               null: false
      t.string :building,              null: false
      t.integer :purchase_history_id,  null:false, foreign_key: true
      t.timestamps
    end
  end
end