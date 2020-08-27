class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_pay
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  
  validates :name, :content, :category_id, :item_status_id, :delivery_pay_id, :delivery_area_id, :delivery_day_id, :image, presence: true
  validates :category_id, :item_status_id, :delivery_pay_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 } 
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
                    
end
