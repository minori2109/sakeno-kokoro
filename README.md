## アプリ名
SAKEnoKOKORO

## 概要
日本酒の通販サイトとレビューサイトを融合させたアプリケーションです。
日本酒を買ってレビューをすることで、味の記録をつけることもできます。
記録用のアプリと通販サイトを行ったり来たりする必要がなくなります。

** 通販サイトで日本酒を買うときの課題 **
- 商品説明だけでは味の想像がつかない
- 通販サイトとレビューサイトがバラバラで、行ったり来たりするのが面倒
- 自分好みのお酒の見つけ方がわからない
- 通販サイトがごちゃごちゃしていて見にくい

** SAKEnoKOKOROでできること **
- 日本酒の購入と味の記録を、ひとつのアプリケーションでできる
- 味と香りの評価がグラフで表示されているのでわかりやすい
- スタイリッシュでシンプルなデザイン

## 本番環境
https://sakeno-kokoro.herokuapp.com/

## テスト用アカウント
** 一般ユーザー **
- メールアドレス: test@mail.com
- パスワード: test123

** 管理者 **
- メールアドレス: admin@mail.com
- パスワード: admin123

## 制作背景（意図）

## DEMO

## 工夫したポイント
- レビューで入力された味と香りの評価をグラフで表示し、商品の特徴が一目でわかるようにした。
- 友人にアプリケーションを使ってもらい、デザインや機能を改善した。

## 使用言語・技術
- Ruby
- Ruby on Rails
- JavaScript
- Bootstrap
- HTML/CSS
- MySQL
- Heroku
- GitHub
- RSpec

## 課題や今後実装したい機能
- ショッピングカート機能を実装し、複数の商品を一度に購入できるようにする。
- 商品検索機能・おすすめ商品表示機能を実装し、より商品を見つけやすくする。
- リファクタリングを行い、よりわかりやすいコードへ修正し、保守をしやすくする。

## DB設計
### usersテーブル

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
- has_one  :address

### itemsテーブル
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
- has_many   :reviews
- has_one    :order
- belongs_to :category
- belongs_to :rice
- belongs_to :storage_method
- belongs_to :kuramoto
- belongs_to :prefecture

### ordersテーブル
| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user_id       | references | null: false, foreign_key: true  |
| item_id       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

### addressesテーブル
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

### reviewsテーブル
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

### categoriesテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

### kuramotosテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

### riceテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

### storage_methodsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items
