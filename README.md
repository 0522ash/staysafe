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
has_many :dangerposts
has_many :places
has_many :placeposts

## Dangers Table

| column  | types      | options           |
| ------- | ---------- | ----------------- |
| title   | string     | null: false       |
| content | text       | null: false       |
| user_id | references | foreign_key: true |

### Association

has_many :danger_places
has_many :places, through: :danger_places
<<<<<<< Updated upstream
=======
has_one :dangerpost

## dangerpost Table

| column | types      | options           |
| ------ | ---------- | ----------------- |
| danger | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :danger
has_one :dangerlocation

## Dangerlocation table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| address   | string     | null: false       |
| latitude  | float      | null: false       |
| longitude | float      | null: false       |
| danger_id | references | foreign_key: true |

### Association

belongs_to :dangerpost
>>>>>>> Stashed changes

## Places Table

| column  | types      | options           |
| ------- | ---------- | ----------------- |
| title   | string     | null: false       |
| content | text       | null: false       |
| user_id | references | foreign_key: true |

### Association

has_many :danger_places
has_many :dangers, through: :danger_places
<<<<<<< Updated upstream
=======
has_one :placepost

## placepost Table

| column | types      | options           |
| ------ | ---------- | ----------------- |
| place  | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :place
has_one :placelocation

## Placelocation table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| address   | string     | null: false       |
| latitude  | float      | null: false       |
| longitude | float      | null: false       |
| place_id  | references | foreign_key: true |

### Association

belongs_to :placepost
>>>>>>> Stashed changes

## Danger_places Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| danger_id | references | foreign_key: true |
| places_id | references | foreign_key: true |

### Association

<<<<<<< Updated upstream
belongs_to :danger
belongs_to :place
=======
belongs_to :place
belongs_to :danger
>>>>>>> Stashed changes
