#フリマアプリテーブル設計


##users テーブル

|  column  |  type  |  options    |
|----------|--------|-------------|
| nickname | string | null: false |
|  email   | string | null: false |


###Association
- has_many :items
- has_many :buy


##items　テーブル

|  column   |  type      |  options                       |
|-----------|------------|--------------------------------|
| item_name | string     | null: false                    |
| category  | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |


###Association
- belongs_to :user
- has_many :buy


##buy　テーブル

|  column   |  type      |  options                       |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


###Association
- belongs_to :users
- belongs_to :items
- has_one :user_address


##user_address テーブル


|  column     |  type      |  options                       |
|-------------|------------|--------------------------------|
| postal code | integer    | null: false                    |
| prefectures | string     | null: false                    |
| cities      | string     | null: false                    |
| address     | integer    | null: false                    |
| phone number| integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


###Association
- belongs_to :buy