# フリマアプリテーブル設計


## users テーブル

|  column              |  type  |  options    |
|----------------------|--------|-------------|
|nickname              |string  | null: false |
|email                 |string  | null: false |
|password              |string  | null: false |
|password_confirmation |string  | null: false |
|last_name             |string  | null: false |
|first_name            |string  | null: false |
|last_name_kana        |string  | null: false | 
|first_name_kana       |string  | null: false |
|birthday_id           |date    | null: false |


### Association
- has_many :items
- has_many :buys


## items テーブル

|  column          |  type      |  options                       |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| item-text        | string     | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| postage_type_id  | integer    | null: false                    |
| ship_from_id     | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- has_one :buy


## buy テーブル(購入履歴)

|  column   |  type      |  options                       |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :user_address


## user_address テーブル


|  column        |  type      |  options                       |
|----------------|------------|--------------------------------|
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null                           |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |


### Association
- belongs_to :buy