class Post < ApplicationRecord

  belongs_to :user
  has_one_attached  :talent_image
  # has_many :comments
  has_many :post_movie_tags
  has_many :movie_tags, through: :post_movie_tags
  has_many :post_talent_tags
  has_many :talent_tags, through: :post_talent_tags

  # validates :movie_main, presence: true
  # validates :movie_main_embedded, presence: true
  # validates :movie_main_thumbnail, presence: true
  # validates :talent_name, presence: true, length: { maximum: 20}
  # validates :user_id, presence: true
  # validates :message, length: { maximum: 250}
end