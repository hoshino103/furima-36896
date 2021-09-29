FactoryBot.define do
  factory :user do
    email             {'test@example'}
    password          {'Test12'}
    password_confirmation {password}
    name              {'test'}
    family_name {'名前'}
    first_name {'確認'}
    family_name_kana {'ナマエ'}
    first_name_kana {'カクニン'}
    birthday {'1995-01-01'}
  end
end