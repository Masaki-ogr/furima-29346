# テーブル設計

## users テーブル

| Column           | Type     | Options     | 
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name kana | string   | null: false |
| first_name kana  | string   | null: false |
| birth            | date     | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| name                | string  | null: false                    |
| description         | text    | null: false                    |
| category_id         | integer | null: false                    |
| condition_id        | integer | null: false                    |
| shipping_charges_id | integer | null: false                    |
| shipping_area_id    | integer | null: false                    |
| price               | integer | null: false                    |
| days_id             | integer | null: false                    |
| user_id             | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column      | Type    | Options                        |
| ----------- | ------- |--------------------------------|
| user_id     | integer | null: false, foreign_key: true |
| item_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery

## delivery テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| zip_code      | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| municipality  | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| buyer_id      | integer   | null: false, foreign_key:true  |

### Association
- belongs_to :buyer