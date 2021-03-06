class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  validates :image, presence: {message:"をアップロードしてください"}
  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "を選択してください" }
  validates :send_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "は半角英数字で入力してください"}
end
