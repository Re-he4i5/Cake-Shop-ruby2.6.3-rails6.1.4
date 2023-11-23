# cake-shop

ケーキ屋さんの EC サイトです。

## 特徴

- 顧客と管理者のログイン機能
- 顧客の注文機能
- 管理者の商品登録機能
- 管理者の注文管理機能

## 始め方

### 前提条件

- Ruby 3.1.2
- Rails 6.1.4

### コマンド

- docker で立ち上げる場合は compose run でコマンドを実行してください。
- サンプルの挿入は`rails db:seed`を実行してください。

```
bundle install
yarn install
rails db:migrate
rails s
```
