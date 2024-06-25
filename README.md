# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| rb_last_name       | string | null: false |
| rb_first_name      | string | null: false |
| birthday           | string | null: false |


### Association
- has_many :items
- has_many :buys

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | string | null: false |
| description        | text   | null: false |
| condition          | string | null: false |
| category           | string | null: false |
| price              | string | null: false |
| post_cost          | string | null: false |
| postage            | string | null: false |
| ship_date          | string | null: false |
| user           | references | null: false, foreign_key: true|
| address        | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :address
- belongs_to :buys
- has_one_attached :image


## buys テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id           | references | null: false, foreign_key: true|
| item_id           | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :items

## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| name               | string | null: false |
| name               | string | null: false |
| name               | string | null: false |
| name               | string | null: false |
| name               | string | null: false |

### Association
- has_many :items
