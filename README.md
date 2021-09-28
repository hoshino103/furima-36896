## usersテーブル
 
| Column             | Type      | Options                  |
| ------------------ | --------- | ------------------------ |
| email              | string    | null: false, unique:true |
| encrypted_password | string    | null: false              |
| name               | string    | null: false              |
| family_name        | string    | null: false              |
| first_name         | string    | null: false              |
| family_name_kana   | string    | null: false              |
| first_name_kana    | string    | null: false              |
| birthday           | data      | null: false              |

## association
has_many :items
has_many :purchase_histories

 
## itemsテーブル


| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | text       | null: false                    |
| text                | string     | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipment_source_id  | integer    | null: false                    |
| send_day_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | foreign_key: true, null: false |

 ## association
 belongs_to :user
 has_one :purchase_history


## purchase_historiesテーブル


| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | foreign_key: true, null: false |
| user       | references | foreign_key: true, null: false |

## association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addresses


| Column         | Type       | Options                |
| -------------- | ---------- | ---------------------- |
| post_num       | string     | null: false            |
| prefectures_id | integer    | null: false            |
| municipalities | string     | null: false            |
| street_number  | string     | null: false            |
| building_name  | string     | null: false            |
| phone_num      | string     | null: false            |

## association
belongs_to :purchase_history