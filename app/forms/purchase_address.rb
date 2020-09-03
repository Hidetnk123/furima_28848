class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building,
                :user_id, :item_id, :token, :tel

  with_options presence: true do
    validates :token, :city, :address, :tel
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :tel, format: {with: /\A\d{11}\z/}
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id,
                   city: city, address: address, building: building, purchase_history_id: purchase_history.id)
  end
                    
end