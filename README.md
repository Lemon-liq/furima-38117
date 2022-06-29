# テーブル設計

## users テーブル

| Column                          | Type     | Options                   |
| ------------------------------- | -------- | ------------------------- |
| nickname                        | string   | null: false               |
| email                           | string   | null: false, unique: true |
| encrypted_password              | string   | null: false               |
| last_name                       | string   | null: false               |
| first_name                      | string   | null: false               |
| last_name_katakana              | string   | null: false,              |
| first_name_katakana             | string   | null: false,              |
| birth                           | date     | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| text               | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| delivery_charge    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| number             | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliverys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| effective        | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| zip_code         | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address_line1    | string     | null: false                    |
| address_line2    | string     |                                |
| tel              | integer    | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy