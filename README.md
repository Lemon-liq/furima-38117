# テーブル設計

## users テーブル

| Column                          | Type     | Options                   |
| ------------------------------- | -------- | ------------------------- |
| nickname                        | string   | null: false               |
| email                           | string   | null: false, unique: true |
| encrypted_password              | string   | null: false               |
| encrypted_password_confirmation | string   | null: false               |
| last_name                       | string   | null: false               |
| first_name                      | string   | null: false               |
| last_name_katakana              | string   | null: false,              |
| first_name_katakana             | string   | null: false,              |
| year                            | detetime | null: false               |
| month                           | detetime | null: false               |
| day                             | detetime | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| prefectures_id     | string     | null: false                    |
| ships_from         | string     | null: false                    |
| number             | string     | null: false                    |
| price              | string     | null: false                    |
| commission         | string     | null: false                    |
| grace              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buy
- has_one :delivery

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

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliverys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| city             | string     | null: false                    |
| address_line1    | string     | null: false                    |
| address_line2    | string     |                                |
| tel              | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy