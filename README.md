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
# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| katakana_last_name  | string  | null: false |
| katakana_first_name | string  | null: false |
| birth               | date    | null: false |

### Association

- has_many :items
- has_many :purchase_histories


## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| name              | string  | null: false |
| content           | string  | null: false |
| category_id       | integer | null: false |
| item_status_id    | integer | null: false |
| delivery_pay_id   | integer | null: false |
| delivery_area_id  | integer | null: false |
| delivery_day_id   | integer | null: false |
| price             | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_history テーブル

| Column     | Type       | Options       |
| ---------- | ---------- | ------------- |
| user_id    | integer    | null: false   |
| item_id    | integer    | null: false   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column         | Type    | Options       |
| -------------- | ------- | ------------- |
| postcode       | integer | null: false   |
| prefecture_id  | integer | null: false   |
| address        | string  | null: false   |
| building       | string  | null: false   |

### Association

- belongs_to :purchase_history