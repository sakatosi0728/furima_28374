# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| birthday    | string | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| images              | string | null: false |
| items_name          | string | null: false |
| explanation         | string | null: false |
| category            | string | null: false |
| items_status        | string | null: false |
| shipping_charges    | string | null: false |
| shipping_region     | string | null: false |
| days_until_shipping | string | null: false |
| price               | string | null: false |

### Association
- has_one :buyers
- belongs_to:users

## buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| room_id   | references | null: false, foreign_key: true |

### Association

- has_one :items
- belongs_to :users
- has_one :buyers_info

## buyers_info テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_information | string     | null: false |
| expiration_date  | string     | null: false |
| security_code    | string     | null: false |
| postal_code      | string     | null: false |
| prefectures      | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building_name    | string     | null: false |
| phone_number     | string     | null: false |

### Association

- has_to :buyers