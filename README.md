## usersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| nickname            | string     | null: false |
| email               | string     | null: false |
| encrypted_password  | string     | null: false |
| last_name           | string     | null: false |
| first_name          | string     | null: false |
| last_name_kana      | string     | null: false |
| first_name_kana     | string     | null: false |
| birthday            | date       | null: false |

### Association
- has_many :reviews
- has_many :orders
- has_one :address

## itemsテーブル
| Column             | Type         | Options                         |
| ------------------ | ------------ | ------------------------------- |
| name               | string       | null: false                     |
| price              | text         | null: false                     |
| info               | string       | null: false                     |
| size               | text         | null: false                     |
| alcohol_degree     | text         | null: false                     |
| category_id        | references   | null: false, foreign_key: true  |
| rice_id            | references   | null: false, foreign_key: true  |
| storage_method_id  | references   | null: false, foreign_key: true  |
| kuramoto_id        | references   | null: false, foreign_key: true  |
| prefecture_id      | integer      | null: false                     |
| delivery_method    | text         | null: false                     |

### Association
- has_many :reviews
- has_one :order
- belongs_to :category
- belongs_to :rice
- belongs_to :storage_method
- belongs_to :kuramoto
- belongs_to :prefecture

## ordersテーブル
| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user_id       | references | null: false, foreign_key: true  |
| item_id       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postcode         | string     | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city             | string     | null: false                     |
| block            | string     | null: false                     |
| building         | string     |                                 |
| phone_number     | string     | null: false                     |
| order            | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :order

## reviewsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| taste            | integer    | null: false                     |
| scent            | integer    | null: false                     |
| recommend_score  | float      | null: false                     |
| otsumami         | string     |                                 |
| comment          | string     | null: false                     |
| user_id          | references | null: false, foreign_key: true  |
| item_id          | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item