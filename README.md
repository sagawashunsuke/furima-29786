# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | string | null: false, unique: true |

### Association

- has_many :items
- has_one :addresses dependent: :destroy
- has_many :buys dependent: :destroy



## items テーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| category_id     | integer    | null: false           |
| delivery_fee    | integer    | null: false           |
| user_id         | references | null: false, FK: true |
| name            | string     | null: false           |
| text            | text       | null: false           |
| condition       | integer    | null: false           |
| price           | integer    | null: false           |
| shipping_area   | integer    | null: false           |
| shipping_day    | integer    | null: false           |

### Association

- belongs_to :user
- has_one :buys dependent: :destroy
- has_one :addresses dependent: :destroy


## buys テーブル

| Column   | Type       | Options               |
| -------- | ---------- | --------------------- |
| user_id  | references | null: false, FK: true |
| item_id  | references | null: false, FK: true |

### Association

- belongs_to :user
- has_one :addresses dependent: :destroy
- has_one :items dependent: :destroy


## addresses テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | ---------------------|
| buy_id     | string     | null: false, FK:true |
| zip_code   | integer    | null: false          |
| prefecture | string     | null: false          |
| city       | string     | null: false          |
| address    | string     | null: false          |
| building   | string     | null: false          |
| telephone  | string     | unique: true         |

### Association

- belongs_to  :user
- has_one :items dependent: :destroy
- has_one :buys dependent: :destroy