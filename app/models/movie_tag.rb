class MovieTag < ApplicationRecord

  validates :movie_tag_name, uniqueness: true

  has_many :post_movie_tags
  has_many :posts, through: :post_movie_tags

  def self.ransackable_attributes(auth_object = nil)
    ["movie_tag_name"]
  end
end
