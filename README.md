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
| category           | integer | null: false |
| condition          | integer | null: false |
| post_cost          | integer | null: false |
| sender             | integer | null: false |
| ship_date          | integer | null: false |
| price              | float   | null: false |
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


## address テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | references | null: false, foreign_key: true|
| sender             | integer    | null: false |
| city               | references | null: false, foreign_key: true|
| street             | references | null: false, foreign_key: true|
| building           | references | foreign_key: true|
| telephone          | references | null: false, foreign_key: true|

### Association
- belongs_to :buys
