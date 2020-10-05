# テーブル設計

## users テーブル

| Column           | Type   | Options     | 
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name kana | string | null: false |
| first_name kana  | string | null: false |
| birth_year       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

### Association
- has_many :items

## items テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| description      | text   | null: false |
| category         | string | null: false |
| condition        | string | null: false |
| shipping_charges | string | null: false |
| shipping_area    | string | null: false |
| days             | string | null: false |
| user_id          | string | null: false |
| image            | string | null: false |

### Association
- belongs_to :user

## purchasers テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| user_id       | reference | null: false |
| zip_code      | integer   | null: false |
| prefecture    | string    | null: false |
| municipality  | string    | null: false |
| address       | string    | null: false |
| building_name | string    | null: false |
| phone_number  | string    | null: false |

### Association
- belongs_to :user
- belongs_to :item