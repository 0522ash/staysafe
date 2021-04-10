# DB設計

## Users Table

| column             | types  | options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| email              | string | null: false |
| username           | string | null: false |
| name               | string | null: false |

### Association

has_many :dangers
has_many :places

## Dangers Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| title     | string     | null: false       |
| content   | text       | null: false       |
| address   | string     | null: false       |
| latitude  | float      |                   |
| longitude | float      |                   |
| user_id   | references | foreign_key: true |

### Association

belongs_to :user
has_many :danger_places
has_many :places, through: :danger_places

## Places Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| title     | string     | null: false       |
| content   | text       | null: false       |
| address   | string     | null: false       |
| latitude  | float      |                   |
| longitude | float      |                   |
| user_id   | references | foreign_key: true |

### Association

belongs_to :user
has_many :danger_places
has_many :dangers, through: :danger_places

## Danger_places Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| danger_id | references | foreign_key: true |
| places_id | references | foreign_key: true |

### Association

belongs_to :danger
belongs_to :place

