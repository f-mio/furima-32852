# README

# データベース設計

## ER図

https://gyazo.com/823c402663da39147c288e03758cabd0

## usersテーブル
#### テーブル
| column             | type    | option             |
|--------------------|---------|--------------------|
| email              | string  | null:false, unique |
| encrypted_password | string  | null:false         |
| nick_name          | string  | null:false         |
| first_name         | string  | null:false         |
| last_name          | string  | null:false         |
| furigana_first     | string  | null:false         |
| furigana_last      | string  | null:false         |
| birthday           | date    | null:false         |
| points             | integer | null:false         |

#### アソシエーション
- has_many items
- has_many purchases
- has_many comments

## itemsテーブル
#### テーブル
| column                | type      | option       |
|-----------------------|-----------|--------------|
| item_name             | string    | null:false   |
| user                  | reference | null:false   |
| price                 | integer   | null:false   |
| category_id           | integer   | null:false   |
| explain               | text      | null:false   |
| state_id              | integer   | null:false   |
| shipping_fee_id       | integer   | null:false   |
| item_prefecture_id    | integer   | null:false   |
| scheduled_delivery_id | integer   | null:false   |

#### アソシエーション
- belongs_to user
- has_one purchase
- has_many comments
- belongs_to category_id
- belongs_to state_id
- belongs_to shipping_fee_id
- belongs_to item_prefecture_id
- belongs_to scheduled_delivery_id

## purchases
#### テーブル
| column          | type      | option       |
|-----------------|-----------|--------------|
| user            | reference | null:false   |
| item            | reference | null:false   |

#### アソシエーション
- belongs_to user
- belongs_to item

## addresses
#### テーブル
| column     | type      | option        |
|------------|-----------|---------------|
| post_code  | string    | null:false    |
| prefecture | integer   | null:false    |
| city       | string    | null:false    |
| address    | string    | null:false    |
| building   | string    | -             |
| tel_num    | string    | null:false    |

#### アソシエーション
- belongs_to purchase

## comments
#### テーブル
| column  | type      | option     |
|---------|-----------|------------|
| user    | reference | null:false |
| item    | reference | null:false |
| comment | text      | null:false |

#### アソシエーション
- belongs_to user
- belongs_to item