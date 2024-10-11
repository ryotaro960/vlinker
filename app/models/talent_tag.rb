class TalentTag < ApplicationRecord

  validates :talent_tag_name, presence: true, unique: true

  has_many :posts
  has_many :posts, through: :posts_talent_tags
  
end
