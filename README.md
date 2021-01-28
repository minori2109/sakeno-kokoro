## SAKEnoKOKORO

## 概要
日本酒の通販サイトとレビューサイトを融合させたアプリケーションです。
日本酒の購入から味の記録まで、このアプリケーションひとつで完結できます。

**SAKEnoKOKOROでできること**
- レビューを参考にして商品を探して購入もできる
- 投稿したレビューが味の記録にもなる
- 味と香りの評価がグラフで表示され、商品の特徴が一目でわかる


## 本番環境
https://sakeno-kokoro.herokuapp.com/

## テスト用アカウント
**一般ユーザー**
- メールアドレス: test@mail.com
- パスワード: test123

**購入用カード情報**
- 番号：4242424242424242
- 期限：4/24
- セキュリティコード：123

**管理者**
- メールアドレス: admin@mail.com
- パスワード: admin123

## 制作背景（意図）
もともと日本酒が大好きです。
家でお酒を飲む機会が増え、通販サイトで日本酒を購入しようとしたところ、味についての説明が少なくどれを買ったらいいか迷ってしまったことがきっかけです。
同じような悩みを抱えている人も多いのではないかと思い、日本酒の購買層について調査を行いました。

SAKETIMESが行った調査では、回答者の64%が20～30代の若年層であり、日本酒に関心を持つ若者が増えていることがわかります。
(https://prtimes.jp/main/html/rd/p/000000027.000034181.html)<br>
<br>
また、週に1日以上日本酒を飲む人の割合は約60％、そのうち日本酒を家で飲む人の割合は約45％であり、家飲みが主流になりつつあることもわかります。<br>
普段から日本酒を購入している人々が重視するポイントとしては「味わい」「特定名称の種類」などが挙げられており、日本酒好きな層においては「**味わい**」が購入の決め手になっていると考えられます。<br>
<br>
そして、Google Adwordsによると「日本酒」と検索するユーザー数は、2017年1月から2020年12月の4年間で**月間約61,000人増加**しており、日本酒ニーズの高まりも伺えます。

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

## 工夫したポイント
- レビューで入力された**味と香りの評価をグラフで表示**し、商品の特徴が一目でわかるようにしました。
- 友人にアプリケーションを使ってもらい、デザインや機能を改善しました。

## DEMO
### レビュー機能
<br>

| レビュー投稿画面        | レビュー表示画面      |
| ------------------- | ----------------- |
| ![review](https://user-images.githubusercontent.com/74651226/105378273-00c4c780-5c4f-11eb-9b93-5d9daa7f5e72.png) | ![item-review](https://user-images.githubusercontent.com/74651226/105378242-f99db980-5c4e-11eb-9c2d-e0a59d5fff62.png) |

<br>
<br>

### トップページ
| トップページ            | 商品詳細画面        |
| ------------------- | ----------------- |
|![toppage](https://user-images.githubusercontent.com/74651226/105378050-c65b2a80-5c4e-11eb-87a7-bd4419b167e1.png) | ![item-detail](https://user-images.githubusercontent.com/74651226/105378351-120dd400-5c4f-11eb-9834-85a0f5140203.png) |

<br>
<br>

### ユーザーマイページ
| ユーザーマイページ     |
| ------------------- |
|![user_mypage](https://user-images.githubusercontent.com/74651226/106103185-e07f9600-6183-11eb-80a2-a7e94faebb4e.png) |

| ユーザー情報編集画面    | レビュー一覧表示画面  |
| ------------------- | ----------------- |
| ![user_info_edit](https://user-images.githubusercontent.com/74651226/106103380-35231100-6184-11eb-9c0a-c72a9898615d.png) | ![user_review](https://user-images.githubusercontent.com/74651226/106104855-57b62980-6186-11eb-8768-89180c42bd23.png) |


## 利用方法
**一般ユーザー**
#### 商品一覧確認
1.URLにアクセス<br>
2.トップページ「商品一覧」をクリック<br>
3.商品名をクリック<br>

#### レビュー投稿
1.ヘッダー右上「ログイン」ボタンをクリックし、上記テストアカウント（一般ユーザー）でログイン<br>
2.トップページ「商品一覧」をクリックし、商品名をクリック<br>
3.商品詳細画面下部の「レビューを投稿する」ボタンをクリック<br>
4.必須事項を記入し、「投稿する」ボタンをクリック<br>

#### レビュー編集・削除
1.ヘッダー右上「ログイン」ボタンをクリックし、上記テストアカウント（一般ユーザー）でログイン<br>
2.ヘッダー右上の「ユーザーニックネーム(〇〇さんの部分)」または、人型アイコンをクリックし、ユーザーマイページへ遷移<br>
3.「商品レビュー一覧」をクリック<br>
4.編集したいレビューの「編集する」ボタンをクリックすると編集画面へ遷移するので、内容の編集を行い「投稿する」ボタンをクリック<br>
5.削除したいレビューの「削除する」ボタンをクリックすると、確認メッセージが表示されるので、「削除する」ボタンをクリック<br>

#### 自分以外のユーザーのレビュー一覧を見る
1.トップページ「商品一覧」をクリック(ログイン不要)<br>
2.商品名をクリック<br>
3.商品詳細画面下部のレビュー一覧から、「投稿者のニックネーム」をクリック<br>
4.レビュー一覧が表示される

#### 商品購入
1.ヘッダー右上「ログイン」ボタンをクリックし、上記テストアカウント（一般ユーザー）でログイン<br>
2.トップページ「商品一覧」をクリックし、商品名をクリック<br>
3.「購入する」ボタンをクリックすると、商品購入ページへ遷移するので、必要事項を入力し「購入する」ボタンをクリック<br>
※クレジットカード情報は、上記の購入用カード情報を入力してください。<br>

**管理者**
#### 商品追加
1.ヘッダー右上「ログイン」ボタンをクリックし、上記テストアカウント（管理者）でログイン<br>
2.トップページ「商品一覧」をクリックし、「商品を追加する」ボタンをクリック<br>
3.商品情報を入力し、「登録する」ボタンをクリック<br>

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
- ショッピングカート機能を実装し、複数の商品を一度に購入できるようにします。
- 商品検索機能・おすすめ商品表示機能を実装し、より商品を見つけやすくします。
- リファクタリングを行い、よりわかりやすいコードへ修正し保守を行いやすくします。

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
