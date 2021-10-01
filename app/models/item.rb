class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  # has_one :purchase_history
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1} 
  validates :status_id, presence: true, numericality: { other_than: 1} 
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1} 
  validates :prefecture_id, presence: true, numericality: { other_than: 0 } 
  validates :send_day_id, presence: true, numericality: { other_than: 1} 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
