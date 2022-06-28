# テーブル設計
(string型, NOT NULL )
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_katakana      | string | null: false, unique: true |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_one :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | string     | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| ships_from         | string     | null: false                    |
| number             | string     | null: false                    |
| price              | string     | null: false                    |
| commission         | string     | null: false                    |
| grace              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buys
- has_one :deliverys

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| effective_date1 | string     | null: false                    |
| effective_date2 | string     | null: false                    |
| security_code   | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :deliverys

## deliverys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| state            | string     | null: false                    |
| city             | string     | null: false                    |
| address_line1    | string     | null: false                    |
| address_line2    | string     | null: false                    |
| tel              | string     | null: false                    |
| item             | references | null: false, foreign_key: true |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buys
- belongs_to :items