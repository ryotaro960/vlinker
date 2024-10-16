class Post < ApplicationRecord

  belongs_to :user
  has_one_attached  :talent_image
  # has_many :comments
  has_many :post_movie_tags
  has_many :movie_tags, through: :post_movie_tags
  has_many :post_talent_tags
  has_many :talent_tags, through: :post_talent_tags

end