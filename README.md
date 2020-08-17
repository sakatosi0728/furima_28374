# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -----------          | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_kana     | string | null: false |
| first_name_kana      | string | null: false |
| birthday             | date   | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| images              | string  | null: false |
| name                | string  | null: false |
| explanation         | text    | null: false |
| category            | string  | null: false |
| status              | string  | null: false |
| shipping_charges    | string  | null: false |
| shipping_region     | string  | null: false |
| days_until_shipping | string  | null: false |
| price               | integer | null: false |

### Association
- has_one :buyer
- belongs_to:user

## buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user
- has_one :buyers_info

## buyers_info テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building_name    | string     |             |
| phone_number     | string     | null: false |

### Association

- has_one :buyer