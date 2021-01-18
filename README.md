# DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|


### Association
- has_many:items 
- has_many:orders 


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|shiping_address_id|integer|null: false|
|shiping_date_id|integer|null: false|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|


### Association
- has_one:order 
- belongs_to:user 



## orderテーブル
|Column|Type|Options|
|------|----|-------|
|user|refernce|null: false, foreign_key: true|
|item|refernce|null: false, foreign_key: true|


### Association
- has_one:item 
- has_one:address
- belongs_to:user



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|string|null: false|
|shiping_address_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string|null: false, unique: true|
|order|reference|null: foreign_key: true|


### Association
- belongs_to:order 
