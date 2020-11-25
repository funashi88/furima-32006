# テーブル設計

## users テーブル

| Column                | Type   | Options                    |
| --------------------- | ------ | -------------------------- |
| nickname              | string | null: false                |
| email                 | string | null: false , unique: true |
| password              | string | null: false                |
| password_confirmation | string | null: false                |
| encrypted_password    | string | null: false                |
| last_name             | string | null: false                |
| first_name            | string | null: false                |
| katakana_last_name    | string | null: false                |
| katakana_first_name   | string | null: false                |
| birthday              | date   | null: false                |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| delivery_fee_burden_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| days_to_ship_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buys

## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addresss テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code_id   | string     | null: false                    |
| prefectures_id | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to :buy