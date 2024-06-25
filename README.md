# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| rb_last_name       | string | null: false |
| rb_first_name      | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item               | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| post_cost_id       | integer | null: false |
| sender_id          | integer | null: false |
| ship_date_id       | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :buy
- has_one_attached :image


## buys テーブル

| Column            | Type       | Options     |
| ------------------| ---------- | ----------- |
| user              | references | null: false, foreign_key: true|
| item              | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | integer    | null: false, foreign_key: true|
| sender_id          | integer    | null: false |
| city               | string     | null: false, foreign_key: true|
| street             | string     | null: false, foreign_key: true|
| building           | string     |             |
| telephone          | integer    | null: false, foreign_key: true|
| buy                | references | null: false, foreign_key: true|

### Association
- belongs_to :buy
