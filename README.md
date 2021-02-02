# README

# データベース設計

## ER図
https://gyazo.com/07ac0009ae6186e76b7c45c56ac9debd

## usersテーブル
#### テーブル
| column         | type      | option     |
|----------------|-----------|------------|
| email          | string    | null:false |
| password       | string    | null:false |
| nick_name      | string    | null:false |
| first_name     | string    | null:false |
| last_name      | string    | null:false |
| furigana_first | string    | null:false |
| furigana_last  | string    | null:false |
| birthday       | date      | null:false |
| points         | integer   | null:false |

#### アソシエーション
- has_many items
- has_many purchases
- has_many comments

## itemsテーブル
#### テーブル
| column                | type      | option       |
|-----------------------|-----------|--------------|
| item_name             | string    | null:false   |
| user_id               | reference | -            |
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
| user_id         | reference | null:false   |
| item_id         | reference | null:false   |
| payment_id      | integer   | null:false   |
| address_id      | integer   | null:false   |
| creditcard_num  | integer   | -            |
| creditcard_lim  | date      | -            |
| creditcard_code | integer   | -            |

#### アソシエーション
- belongs_to user
- belongs_to item
- belongs_to payment_id
- belongs_to address_id

## addresses
#### テーブル
| column    | type      | option        |
|-----------|-----------|---------------|
| post_num  | integer   | null:false    |
| address   | text      | null:false    |
| tel_num   | integer   | null:false    |

#### アソシエーション
- belongs_to purchase

## comments
#### テーブル
| column    | type      | option        |
|-----------|-----------|---------------|
| user_id   | reference | -             |
| item_id   | reference | -             |
| comment   | text      | null:false    |

#### アソシエーション
- belongs_to user
- belongs_to item

## categories
#### テーブル
| column          | type      | option       |
|-----------------|-----------|--------------|
| category        | string    | null:false   |

#### アソシエーション
- has_many items

## states
#### テーブル
| column       | type      | option       |
|--------------|-----------|--------------|
| state        | string    | null:false   |

#### アソシエーション
- has_many items

## shipping_fees
#### テーブル
| column     | type      | option       |
|------------|-----------|--------------|
| pay_user   | boolean   | null:false   |

#### アソシエーション
- has_many items

## item_prefectures
#### テーブル
| column     | type      | option       |
|------------|-----------|--------------|
| prefecture | string    | null:false   |

#### アソシエーション
- has_many items

## scheduled_deliveries
#### テーブル
| column     | type      | option       |
|------------|-----------|--------------|
| schedule   | string    | null:false   |

#### アソシエーション
- has_many items

## payments
#### テーブル
| column     | type      | option       |
|------------|-----------|--------------|
| method     | string    | null:false   |

#### アソシエーション
- has_many purchases
