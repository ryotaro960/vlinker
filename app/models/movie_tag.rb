class MovieTag < ApplicationRecord

  validates :movie_tag_name, presence: true, unique: true

  has_many :posts
  has_many :posts, through: :posts_movie_tags

end
