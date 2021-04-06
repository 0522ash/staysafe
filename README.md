# DB設計

## Users Table

| column             | types  | options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| email              | string | null: false |
| username           | string | null: false |
| name               | string | null: false |

### Association

has_many :places
has_many :dangers

## Dangers Table

| column  | types      | options           |
| ------- | ---------- | ----------------- |
| title   | string     | null: false       |
| content | text       | null: false       |
| user_id | references | foreign_key: true |

### Association

belongs_to :user
has_many :danger_places
has_many :places, through: :danger_places
has_one :dangerspot

## Dangerspot table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| address   | string     | null: false       |
| latitude  | float      | null: false       |
| longitude | float      | null: false       |
| danger_id | references | foreign_key: true |

### Association

has_one :danger

## Places Table

| column  | types      | options           |
| ------- | ---------- | ----------------- |
| title   | string     | null: false       |
| content | text       | null: false       |
| user_id | references | foreign_key: true |

### Association

belongs_to :user
has_many :danger_places
has_many :dangers, through: :danger_places
has_one :placespot

## Placespot table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| address   | string     | null: false       |
| latitude  | float      | null: false       |
| longitude | float      | null: false       |
| place_id  | references | foreign_key: true |

### Association

has_one :place

## Danger_places Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| danger_id | references | foreign_key: true |
| places_id | references | foreign_key: true |

### Association

belongs_to :place