# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -----------          | ------ | ----------- |
| nickname             | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_name(kana)  | string | null: false |
| first_name(kana)  | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| images              | string  | null: false |
| items_name          | string  | null: false |
| explanation         | string  | null: false |
| price               | integer | null: false |

### Association
- has_one :buyers
- belongs_to:users

## buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one :items
- belongs_to :users
- has_one :buyers_info

## buyers_info テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefectures      | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building_name    | string     |             |
| phone_number     | string     | null: false |

### Association

- has_to :buyers