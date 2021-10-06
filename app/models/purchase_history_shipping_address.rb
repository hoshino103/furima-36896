class PurchaseHistoryShippingAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_num, :prefecture_id, :municipalities, :street_number, :building_name, :phone_num, :purchase_history

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipalities
    validates :street_number
    validates :phone_num, format: {with: /\A[0-9]+\z/}
    validates :purchase_history 

  end

end