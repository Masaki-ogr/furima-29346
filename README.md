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

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| description      | text    | null: false                    |
| category         | integer | null: false                    |
| condition        | integer | null: false                    |
| shipping_charges | integer | null: false                    |
| shipping_area    | integer | null: false                    |
| days             | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column      | Type    | Options                        |
| ----------- | ------- |--------------------------------|
| user_id     | integer | null: false, foreign_key: true |
| item_id     | integer | null: false, foreign_key: true |
| delivery_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :delivery

## delivery テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| zip_code      | string    | null: false                    |
| prefecture    | integer   | null: false                    |
| municipality  | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |

### Association
- belongs_to :buyer