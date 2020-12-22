## usersテーブル

|Colum                    |Type     |Options                      | 
|-------------------------|---------|-----------------------------|
|nickname                 |string   |null: false                  | 
|email                    |string   |null: false, unique: true    | 
|encrypted_password       |string   |null: false                  | 
|first_name               |string   |null: false                  |
|last_name                |string   |null: false                  |
|first_name_kana          |string   |null: false                  |
|last_name_kana           |string   |null: false                  |
|birthday                 |date     |null: false                  |


### Association
 has_many items
 has_many purchases








## itemsテーブル

|Colum                    |Type       |Options                              | 
|-------------------------|-----------|-------------------------------------|
|user                     |references |null: false, foreign_key: true       |
|name                     |string     |null: false                          | 
|explain                  |text       |null: false                          | 
|category_id              |integer    |null: false                          | 
|condition_id             |integer    |null: false                          |
|postage_id               |integer    |null: false                          |
|prefecture_id            |integer    |null: false                          |
|shipping_date_id         |integer    |null: false                          |
|price                    |integer    |null: false                          |


### Association
 has_one purchase
 belongs_to user








## purchasesテーブル

|Colum                    |Type        |  Options                            | 
|-------------------------|------------|-------------------------------------|
|user                     |references  |null: false, foreign_key: true       | 
|item                     |references  |null: false, foreign_key: true       |   


### Association
 has_one address
 belongs_to user
 belongs_to item














## addressテーブル

|Colum                    |Type        |Options                              | 
|-------------------------|------------|-------------------------------------|
|purchase                 |references  |null: false, foreign_key: true       |
|postal_number            |string      |null: false                          | 
|prefecture_id            |integer     |null: false                          | 
|city                     |string      |null: false                          | 
|district                 |string      |null: false                          | 
|building_number          |string      |                                     |
|phone_number             |string      |null: false                          |



### Association
 belongs_to purchase
