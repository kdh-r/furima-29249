#フリマアプリテーブル設計


##users テーブル

|  column              |  type  |  options    |
|----------------------|--------|-------------|
|nickname              |string  | null: false |
|email                 |string  | null: false |
|password              |integer | null: false |
|password_confirmation |integer | null: false |
|last_name             |string  | null: false |
|first_name            |string  | null: false |
|last_name_kana        |string  | null: false | 
|first_name_kana       |string  | null: false |
|birthday_id           |integer | null: false |


###Association
- has_many :items
- has_many :buy


##items テーブル

|  column          |  type      |  options                       |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| item_img         | string     | null: false                    |
| item-text        | string     | null: false                    |
| category-id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| postage_type_id  | integer    | null: false                    |
| ship_from_id     | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |



###Association
- belongs_to :user
- has_many :buy


##buy テーブル

|  column   |  type      |  options                       |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


###Association
- belongs_to :users
- belongs_to :items
- has_one :user_address


##user_address テーブル


|  column        |  type      |  options                       |
|----------------|------------|--------------------------------|
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| cities         | string     | null: false                    |
| address        | integer    | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |


###Association
- belongs_to :buy