class MovieTag < ApplicationRecord

  validates :movie_tag_name, uniqueness: true

  has_many :posts
  has_many :posts, through: :post_movie_tags

end
