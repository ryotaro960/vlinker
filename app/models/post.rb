class Post < ApplicationRecord

  validates :movie_main, presence: true
  validates :movie_main_thumbnail, presence: true
  validates :talent_name, presence: true, length: { maximum: 30}

  belongs_to :user
  has_one  :talent_image
  # has_many :comments
  has_many :movie_tag, through: :post_movie_tags
  has_many :talent_tag, through: :post_talent_tags

end
