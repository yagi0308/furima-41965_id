# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| date_of_birth      | date   | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

has_many :items
has_many :purchases

## items（商品情報） テーブル

| Column                         | Type        | Options     |
| ------------------             | ------      | ----------- |
| item_name                      | string      | null: false |
| item_info                      | text        | null: false |
| item_price                     | integer     | null: false |
| item_category_id               | integer     | null: false |
| item_status_id                 | integer     | null: false |
| item_shipping_fee_id           | integer     | null: false |
| item_prefecture_id             | integer     | null: false |
| item_scheduled_delivery_id     | integer     | null: false |
| user                           | references  | null: false, foreign_key: true | 

belongs_to :user
has_one :purchase

## purchases（購入記録） テーブル
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| user               |references| null: false, foreign_key: true |
| item               |references| null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses（発送先情報） テーブル
| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| purchase           | references | null: false, foreign_key: true |

belongs_to :purchase