class PostMovieTag < ApplicationRecord

  validates :post, presence: true
  validates :movie_tag, presence: true

  belongs_to :post
  belongs_to :movie

end
