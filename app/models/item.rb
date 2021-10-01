class Item < ApplicationRecord
  belongs_to :user_id
  has_one :purchase_history
end
