# DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|mail|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|


### Association
- has_many:items 
- has_many:orders 
- has_one:address 



## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|text|null: false|
|category|string|null: false|
|status|string|null: false|
|delivery_fee|string|null: false|
|shiping_address|string|null: false|
|shiping_date|date|null: false|
|price|string|null: false|
|user|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|sold|boolean||


### Association
- has_one:order 
- belongs_to:user 



## orderテーブル
|Column|Type|Options|
|------|----|-------|
|user|refernce|null: false, foreign_key: true|
|item|refernce|null: false, foreign_key: true|


### Association
- has_many:items 
- belongs_to:user 



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string|null: false, unique: true|


### Association
- has_many:items 
- belongs_to:user 
