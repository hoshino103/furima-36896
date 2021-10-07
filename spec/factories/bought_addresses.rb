FactoryBot.define do
  factory :bought_address do
    post_num {'123-4567'}
    prefecture_id {3}
    municipalities {'世田谷区'}
    street_number {'4-2'}
    building_name {'建物名'}
    phone_num { '09092348374' }
    user_id {1}
    item_id {1}

  end
end
