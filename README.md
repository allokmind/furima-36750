# テーブル設計

## users テーブル

| Column                 | Type     | Options     |
| ---------------------- | -------- | ----------- |
| email                  | string   | null: false |
| encrypted_password     | string   | null: false |
| nickname               | string   | null: false |
| last_name              | string   | null: false |
| first_name             | string   | null: false |
| last_name_kana         | string   | null: false |
| first_name_kana        | string   | null: false |
| birth_year             | integer  | null: false |
| birth_month            | integer  | null: false |
| birth_day              | integer  | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options            |
| ---------------------- | ---------- | -------------------|
| item_name              | string     | null: false        |
| description            | text       | null: false        |
| category               | string     | null: false        |
| status                 | string     | null: false        |
| shipping_cost          | string     | null: false        |
| prefecture             | string     | null: false        |
| shipping_day           | string     | null: false        |
| price                  | integer    | null: false        |
| user                   | references | foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column                 | Type       | Options            |
| ---------------------- | ---------- | ------------------ |
| user                   | references | foreign_key: true  |
| item                   | references | foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                 | Type       | Options            |
| ---------------------- | ---------- | -------------------|
| postal_code            | string     | null: false        |
| province               | string     | null: false        |
| city                   | string     | null: false        |
| address_line           | string     | null: false        |
| building_name          | string     |                    |
| phone_number           | integer    | null: false        |
| order                  | references | foreign_key: true  |

- belongs_to :order
