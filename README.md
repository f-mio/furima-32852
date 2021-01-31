# README

# データベース設計

## usersテーブル
#### テーブル
| column   | type      | option     |
|----------|-----------|------------|
| email    | string    | null:false |
| password | string    | null:false |

#### アソシエーション
- has_one profile
- has_many items
- has_many purchases
- has_many comments
- has_many favorite_items
- has_many unliked_items

## itemsテーブル
#### テーブル
| column              | type      | option       |
|---------------------|-----------|--------------|
| item_name           | string    | null:false   |
| user_id             | reference | -            |
| price               | integer   | null:false   |
| category_id         | reference | -            |
| image               | -         | ActiveStorage|
| explanation         | text      | null:false   |
| state_id            | reference | -            |
| shipping_charge_id  | reference | -            |
| delivery_from       | string    | null:false   |
| delivery_day_id     | reference | -            |

#### アソシエーション
- belongs_to user
- has_one purchase
- has_many comments
- has_many unliked_item
- has_many favorite_items
- has_one category
- has_one states
- has_one shipping_charge
- has_one payment_method

## purchases
#### テーブル
| column              | type      | option       |
|---------------------|-----------|--------------|
| user_id             | reference | null:false   |
| item_id             | reference | null:false   |
| payment_method_id   | reference | null:false   |
| to_country_id       | reference | null:false   |
| to_postnumber       | integer   | null:false   |
| to_adress           | string    | null:false   |
| tel_number          | integer   | null:false   |
| creditcard_num      | integer   | -            |
| creditcard_lim      | date      | -            |
| creditcard_code     | string    | -            |

#### アソシエーション
- belongs_to user
- belongs_to item
- has_one payment_method

## comments
#### テーブル
| column    | type      | option        |
|-----------|-----------|---------------|
| text      | text      | null:false    |
| user_id   | reference | -             |
| item_id   | reference | -             |

#### アソシエーション
- belongs_to user
- belongs_to item

## profileテーブル
#### テーブル
| column       | type      | option     |
|--------------|-----------|------------|
| user_id      | reference | -          |
| nick_name    | string    | null:false |
| first_name   | string    | null:false |
| last_name    | string    | null:false |
| furigana_f   | string    | null:false |
| furigana_l   | strint    | null:false |
| birth_year   | integer   | -          |
| birth_month  | integer   | -          |
| birth_day    | integer   | -          |
| credit_num   | integer   | -          |
| credit_limit | date      | -          |
| points       | integer   | null:false |

#### アソシエーション
・belongs_to user

## categoriesテーブル
#### テーブル
| column       | type      | option     |
|--------------|-----------|------------|
| item_id      | reference | -          |
| category     | string    | null:false |

#### アソシエーション
- belongs_to item

## statesテーブル
#### テーブル
| column       | type      | option     |
|--------------|-----------|------------|
| item_id       | reference | -          |
| state        | string    | null:false |

#### アソシエーション
- belongs_to item

## shipping_chargesテーブル
#### テーブル
| column       | type      | option     |
|--------------|-----------|------------|
| item_id      | reference | -          |
| category     | string    | null:false |

#### アソシエーション
- belongs_to item

## delivery_datesテーブル
#### テーブル
| column        | type      | option     |
|---------------|-----------|------------|
| item_id       | reference | -          |
| delivery_date | date      | null:false |

#### アソシエーション
- belongs_to item

## payment_methodsテーブル
#### テーブル
| column         | type      | option     |
|----------------|-----------|------------|
| item_id        | reference | -          |
| payment_method | string    | null:false |

#### アソシエーション
- belongs_to item

## favorite_itemsテーブル
#### テーブル
| column     | type      | option     |
|------------|-----------|------------|
| user_id    | reference | -          |
| item_id    | reference | -          |
| favorite   | boolean   | null:false |

#### アソシエーション
- belongs_to user
- belongs_to item

## unlikesテーブル
#### テーブル
| column     | type      | option     |
|------------|-----------|------------|
| user_id    | reference | -          |
| item_id    | reference | -          |
| unlike     | boolean   | null:false |

#### アソシエーション
- belongs_to user
- belongs_to item
