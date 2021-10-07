class BoughtAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_num, :prefecture_id, :municipalities, :street_number, :building_name, :phone_num, :purchase_history

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/} 
  end

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_num: post_num, prefecture_id: prefecture_id, municipalities: municipalities, street_number: street_number, building_name: building_name, phone_num: phone_num, purchase_history_id: purchase_history.id)
  end

end