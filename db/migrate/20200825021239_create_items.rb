class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.string :content, null: false, default: ""
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :delivery_pay_id, null: false
      t.integer :delivery_area_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
