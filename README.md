## SAKEnoKOKORO

## 概要
日本酒の通販サイトとレビューサイトを融合させたアプリケーションです。
日本酒の購入から味の記録まで、このアプリケーションひとつで完結できます。

**SAKEnoKOKOROでできること**
- レビューを参考にして商品を探して購入もできる
- 投稿したレビューが味の記録にもなる
- 味と香りの評価がグラフで表示されてわかりやすい


## 本番環境
https://sakeno-kokoro.herokuapp.com/

## テスト用アカウント
**一般ユーザー**
- メールアドレス: test@mail.com
- パスワード: test123

**管理者**
- メールアドレス: admin@mail.com
- パスワード: admin123

## 制作背景（意図）
もともと日本酒が大好きです。
家でお酒を飲む機会が増え、通販サイトで日本酒を購入しようとしたところ、味についての説明が少なくどれを買ったらいいか迷ってしまったことがきっかけです。
同じような悩みを抱えている人も多いのではないかと思い、日本酒の購買層について調査を行いました。

SAKETIMESが行った調査では、回答者の64%が20～30代の若年層であり、日本酒に関心を持つ若者が増えていることがわかります。
(https://prtimes.jp/main/html/rd/p/000000027.000034181.html)
また、週に1日以上日本酒を飲む人の割合は約60％、そのうち日本酒を家で飲む人の割合は約４５％であり、家飲みが主流になりつつあることもわかります。
普段から日本酒を購入している人々が重視するポイントとしては「味わい」「特定名称の種類」などが挙げられており、日本酒好きな層においては「味わい」が購入の決め手になっていると考えられます。
そして、Google Adwordsによると「日本酒」と検索するユーザー数は、2017年1月から2020年12月の４年間で約61,000人増加しており、日本酒ニーズの高まりも伺えます。

しかし、「日本酒」と検索した際に出てくる通販サイトは、全体的にデザインが古く、ごちゃごちゃしていて見にくいものが多く見受けられます。
「SAKETIMES」や「さけのわ」といったメディアには多くの口コミが掲載されていますが、味に関する情報が少なかったり、チャートがわかりづらかったりといった懸念点が挙げられます。

上記の調査から、以下のような課題があるのではないかと仮説を立てました。
- 日本酒を飲むことを習慣にしている層においては「味わい」が重要であるが、味わいがわかりやすく記載されているものがない
- 味について記載されているメディア（SAKETIMESなど）と通販サイトが分散されており、購入しづらい
- 日本酒の通販サイトは、情報が雑多に掲載されており、分かりづらいイメージがある

このような課題を解決するために、今回以下のようなアプリケーションを作成しました。
- シンプルでスタイリッシュなデザインのECサイト
- レビュー投稿時に味と香りを点数で評価してもらい、グラフで表示する
- 通販サイトとレビューをひとつにまとめたことで、複数のサイトやアプリを行き来する手間をなくした

検索機能やおすすめ商品表示機能の実装を行い、さらに使いやすいアプリケーションへと改善を続けます。

## DEMO
- トップページ
- レビュー投稿画面
- レビュー表示画面

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
- リファクタリングを行い、よりわかりやすいコードへ修正し保守をしやすくする。

## DB設計
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
- has_one  :address

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

## categoriesテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

## kuramotosテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

## riceテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items

## storage_methodsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |

### Association
- has_many :items
