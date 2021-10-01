class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user_id
  has_one :purchase_history

  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } 

end
