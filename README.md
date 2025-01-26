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
| name               | string | null: false |
| name_reading       | string | null: false |
| date_of_birth      | date   | null: false |

has_many :items
has_many :purchases

## items（商品情報） テーブル

| Column             | Type           | Options     |
| ------------------ | ------         | ----------- |
| image              | string         | null: false |
| name               | string         | null: false |
| description        | text           | null: false |
| category           | integer        | null: false |
| condition          | integer        | null: false |
| shipping_cost      | integer        | null: false |
| shipping_origin    | integer        | null: false |
| shipping_days      | integer        | null: false |
| price              | integer        | null: false |
| selling_fee        | integer        | null: false |
| profit             | integer        | null: false |
| user_id            | references     | null: false, foreign_key: true | 

belongs_to :user
has_one :purchase

## purchases（購入記録） テーブル
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| user_id            |references| null: false, foreign_key: true |
| item_id            |references| null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses（発送先情報） テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | integer| null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |

belongs_to :purchase