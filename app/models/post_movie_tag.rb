class PostMovieTag < ApplicationRecord

  belongs_to :post
  belongs_to :movie_tag

end
