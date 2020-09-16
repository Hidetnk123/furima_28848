class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_pay
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name, :content, :image
    validates :category_id, :item_status_id, :delivery_pay_id, 
              :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 } 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  
  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
