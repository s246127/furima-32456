## usersテーブル

|Colum                    |Type     |Options                      | 
|-------------------------|---------|-----------------------------|
|nickname                 |string   |null: false                  | 
|email                    |string   |null: false, unique: true    | 
|password                 |string   |null: false                  | 
|password confirmation    |string   |null: false                  | 
|first_name               |string   |null: false                  |
|last_name                |string   |null: false                  |
|first_name_kana          |string   |null: false                  |
|last_name                |string   |null: false                  |
|birthday                 |date     |null: false                  |


### has_many items
### has_many purchase








## itemsテーブル

|Colum                    |Type     |Options        | 
|-------------------------|---------|---------------|
|name                     |string   |null: false    | 
|image                    |string   |null: false    | 
|explain                  |text     |null: false    | 
|category_id              |integer  |null: false    | 
|condition_id             |integer  |null: false    |
|postage                  |integer  |null: false    |
|prefecture_id            |string   |null: false    |
|shipping_date_id         |date     |null: false    |
|price                    |integer  |null: false    |
|buyer_id                 |integer  |null: false    |
|seller_id                |integer  |null: false    |


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
|user_id                  |references  |null: false, foreign_key: true       |
|postal_number            |integer     |null: false                          | 
|prefecture               |string      |null: false                          | 
|city                     |string      |null: false                          | 
|district                 |string      |null: false                          | 
|building_number          |string      |                                     |


### belongs_to purchase



null: false	カラムが空の状態では保存できない
unique: true	一意性のみ許可（同じ値は保存できない）
foreign_key: true	外部キーを設定（別テーブルのカラムを参照する）
	
