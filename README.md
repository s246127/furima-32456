## usersテーブル

|Colum                    |Type     |Options                      | 
|-------------------------|---------|-----------------------------|
|nickname                 |string   |null: false                  | 
|email                    |string   |null: false, unique: true    | 
|encrypted_password       |string   |null: false                  | 
|first_name               |string   |null: false                  |
|last_name                |string   |null: false                  |
|first_name_kana          |string   |null: false                  |
|last_name                |string   |null: false                  |
|birthday                 |date     |null: false                  |


### has_many items
### has_many purchase








## itemsテーブル

|Colum                    |Type       |Options                              | 
|-------------------------|-----------|-------------------------------------|
|user_id                  |references |null: false, foreign_key: true       |
|name                     |string     |null: false                          | 
|explain                  |text       |null: false                          | 
|category_id              |integer    |null: false                          | 
|condition_id             |integer    |null: false                          |
|postage_id               |integer    |null: false                          |
|prefecture_id            |string     |null: false                          |
|shipping_date_id         |date       |null: false                          |
|price                    |integer    |null: false                          |


### has_one purchase
### belongs_to user








## purchaseテーブル

|Colum                    |Type        |  Options                            | 
|-------------------------|------------|-------------------------------------|
|user_id                  |references  |null: false, foreign_key: true       | 
|item_id                  |references  |null: false, foreign_key: true       |   


### has_one address
### belongs_to user











## addressテーブル

|Colum                    |Type        |Options                              | 
|-------------------------|------------|-------------------------------------|
|purchase_id              |references  |null: false, foreign_key: true       |
|postal_number            |string      |null: false                          | 
|prefecture               |integer     |null: false                          | 
|city                     |string      |null: false                          | 
|district                 |string      |null: false                          | 
|building_number          |string      |                                     |
|phone_number             |integer     |null: false,unique: true             |



### belongs_to purchase



null: false	カラムが空の状態では保存できない
unique: true	一意性のみ許可（同じ値は保存できない）
foreign_key: true	外部キーを設定（別テーブルのカラムを参照する）
	
