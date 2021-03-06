# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :buys dependent: :destroy


## items テーブル

| Column           | Type       | Options               |
| ---------------- | ---------- | --------------------- |
| category_id      | integer    | null: false           |
| delivery_fee_id  | integer    | null: false           |
| user_id          | integer    | null: false, FK: true |
| name             | string     | null: false           |
| text             | text       | null: false           |
| status_id        | integer    | null: false           |
| price            | integer    | null: false           |
| shipping_area_id | integer    | null: false           |
| shipping_day_id  | integer    | null: false           |

### Association

- belongs_to :user
- has_one :buy


## orders テーブル

| Column | Type       | Options               |
| ------ | ---------- | --------------------- |
| user   | references | null: false, FK: true |
| item   | references | null: false, FK: true |

### Association

- belongs_to :user
- has_one :address dependent: :destroy
- belongs_to :item dependent: :destroy


## addresses テーブル

| Column        | Type       | Options              |
| ------------- | ---------- | -------------------- |
| user_id       | integer    | null: false, FK:true |
| zip_code      | string     | null: false          |
| prefecture_id | integer    | null: false          |
| city          | string     | null: false          |
| house_number  | string     | null: false          |
| building      | string     |                      |
| telephone     | string     | null: false          |

### Association

- belongs_to :buy dependent: :destroy