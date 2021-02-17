# README

# データベース設計
## ER図

https://gyazo.com/69dc48f513c15b2c9a8add121b96fd02

## usersテーブル
#### テーブル
| column             | type    | option                  |
|--------------------|---------|-------------------------|
| email              | string  | null:false, unique:true |
| encrypted_password | string  | null:false              |
| nick_name          | string  | null:false              |
| first_name         | string  | null:false              |
| last_name          | string  | null:false              |
| first_name_reading | string  | null:false              |
| last_name_reading  | string  | null:false              |
| birthday           | date    | null:false              |

#### アソシエーション
- has_many items
- has_many purchases
- has_many comments

## itemsテーブル
#### テーブル
| column                | type      | option                       |
|-----------------------|-----------|------------------------------|
| name                  | string    | null:false                   |
| user                  | reference | null:false,foreign_key :true |
| price                 | integer   | null:false                   |
| category_id           | integer   | null:false                   |
| explain               | text      | null:false                   |
| state_id              | integer   | null:false                   |
| shipping_fee_id       | integer   | null:false                   |
| prefecture_id         | integer   | null:false                   |
| scheduled_delivery_id | integer   | null:false                   |

#### アソシエーション
- belongs_to user
- has_one purchase
- has_many comments

## purchases
#### テーブル
| column          | type      | option                       |
|-----------------|-----------|------------------------------|
| user            | reference | null:false,foreign_key :true |
| item            | reference | null:false,foreign_key :true |

#### アソシエーション
- belongs_to user
- belongs_to item
- has_one address

## addresses
#### テーブル
| column        | type      | option                       |
|---------------|-----------|------------------------------|
| purchase      | reference | null:false,foreign_key :true |
| post_code     | string    | null:false                   |
| prefecture_id | integer   | null:false                   |
| city          | string    | null:false                   |
| address       | string    | null:false                   |
| building      | string    | -                            |
| tel_num       | string    | null:false                   |

#### アソシエーション
- belongs_to purchase

## comments
#### テーブル
| column  | type      | option                       |
|---------|-----------|------------------------------|
| user    | reference | null:false,foreign_key :true |
| item    | reference | null:false,foreign_key :true |
| comment | text      | null:false                   |

#### アソシエーション
- belongs_to user
- belongs_to item