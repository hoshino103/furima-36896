## usersテーブル
 
| Column             | Type      | Options                |
| ------------------ | --------- | ---------------------- |
| email              | string    | null: false            |
| encrypted_password | string    | null: false            |
| name               | string    | null: false            |
| family_name        | text      | null: false            |
| first_name         | text      | null: false            |
| family_name_kana   | text      | null: false            |
| first_name_kana    | text      | null: false            |
| birthday           | integer   | null: false            |

## association
has_many :items
has_many :purchase_histories

 
## itemsテーブル


| Column              | Type       | Options                |
| ------------------- | ---------- | ---------------------- |
| image               | image      | null: false            |
| name                | text       | null: false            |
| text                | text       | null: false            |
| category_id         | integer    | null: false            |
| status_id           | integer    | null: false            |
| shipping_charges_id | integer    | null: false            |
| shipment_source_id  | integer    | null: false            |
| send_day_id         | integer    | null: false            |
| price               | integer    | null: false            |
| user_id             | references | foreign_key: true      |

 ## association
 belongs_to :user
 has_one :purchase_history


## purchase_historiesテーブル


| Column     | Type       | Options                |
| ---------- | ---------- | ---------------------- |
| item       | references | foreign_key: true      |
| user       | references | foreign_key: true      |

## association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addresses


| Column     | Type       | Options                |
| ---------- | ---------- | ---------------------- |
| post_num   | integer    | null: false            |
| address    | text       | null: false            |
| phone_num  | integer    | null: false            |

## association
belongs_to :purchase_history