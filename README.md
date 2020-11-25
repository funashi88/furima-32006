# テーブル設計

## users テーブル

| Column                | Type   | Options                    |
| --------------------- | ------ | -------------------------- |
| nickname              | string | null: false                |
| email                 | string | null: false , unique: true |
| password              | string | null: false                |
| password_confirmation | string | null: false                |
| last_name             | string | null: false                |
| first_name            | string | null: false                |
| katakana_last_name    | string | null: false                |
| katakana_first_name   | string | null: false                |
| birth_year            | string | null: false                |
| birth_month           | string | null: false                |
| birth_day             | string | null: false                |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_explanation    | text       | null: false                    |
| category            |            | null: false                    |
| delivery_fee_burden |            | null: false                    |
| shipping_area       |            | null: false                    |
| days_to_ship        |            | null: false                    |
| item_price          | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buys

## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buy_date     | text       | null: false                    |
| listing_user | references | null: false, foreign_key: true |
| buy_user     | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addresss テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy