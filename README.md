# README

## users テーブル

| Column           | Type | Options   |
| ---------------- | ---- | --------- |
|nickname          |string|null: false|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|comment           |string|           |

### Association

- has_many :posts
- has_many :comments, through: :posts
- has_one  :user_image


## posts テーブル

| Column              | Type     | Options   |
| ------------------- | -------- | --------- |
|user                 |references|null: false, foreign_key: true|
|movie_main           |string    |null: false|
|movie_main_embedded  |string    |null: false|
|movie_main_thumbnail |string    |null: false|
|movie_left           |string    |           |
|movie_left_embedded  |string    |           |
|movie_right          |string    |           |
|movie_right_embedded |string    |           |
|talent_name          |string    |null: false|
|talent_belongs       |string    |           |
|talent_channel       |string    |           |
|talent_x             |string    |           |
|talent_hp            |string    |           |
|message              |string    |           |

### Association

- belongs_to :user
- has_one  :talent_image
- has_many :comments
- has_many :movie_tags, through: :post_movie_tags
- has_many :talent_tags, through: :post_talent_tags


## movie_tagsテーブル

| Column       | Type | Options                 |
| ------------ | ---- | ----------------------- |
|movie_tag_name|string|null: false, unique: true|

### Association

- has_many :posts
- has_many :posts, through: :posts_movie_tags


## post_movie_tagsテーブル

| Column  | Type     | Options                      |
| ------- | -------- | ---------------------------- |
|post     |references|null: false, foreign_key: true|
|movie_tag|references|null: false, foreign_key: true|

### Association

- belongs_to :post
- belongs_to :movie


## talent_tagsテーブル

| Column        | Type | Options                 |
| ------------- | ---- | ----------------------- |
|talent_tag_name|string|null: false, unique: true|

### Association

- has_many :posts
- has_many :posts, through: :posts_talent_tags


## post_talent_tagsテーブル

| Column   | Type     | Options                      |
| -------- | -------- | ---------------------------- |
|post      |references|null: false, foreign_key: true|
|talent_tag|references|null: false, foreign_key: true|

- belongs_to :post
- belongs_to :talent


## comments テーブル

|Column | Type     | Options                      |
| ----- | -------- | ---------------------------- |
|content|string    |null: false                   |
|user   |references|null: false, foreign_key: true|
|post   |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :post