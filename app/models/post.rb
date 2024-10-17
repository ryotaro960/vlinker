class Post < ApplicationRecord

  belongs_to :user
  has_one_attached  :talent_image
  # has_many :comments, dependent: :destroy
  has_many :post_movie_tags, dependent: :destroy
  has_many :movie_tags, through: :post_movie_tags
  has_many :post_talent_tags, dependent: :destroy
  has_many :talent_tags, through: :post_talent_tags

  def self.ransackable_attributes(auth_object = nil)
    ["talent_name", "talent_belongs", "message"]
  end

  def self.search_by_movietag(movie_tag_name)
    joins(:movie_tags).where(movie_tags: { movie_tag_name: movie_tag_name })
  end

  def self.search_by_talenttag(talent_tag_name)
    joins(:talent_tags).where(talent_tags: { talent_tag_name: talent_tag_name })
  end
end