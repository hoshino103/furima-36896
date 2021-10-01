class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  # has_one :purchase_history
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
