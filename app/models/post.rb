class Post < ApplicationRecord

  belongs_to :user
  has_one_attached  :talent_image
  # has_many :comments
  # has_many :movie_tag, through: :post_movie_tags
  # has_many :talent_tag, through: :post_talent_tags

end