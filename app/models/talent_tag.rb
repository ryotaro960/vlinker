class TalentTag < ApplicationRecord

  validates :talent_tag_name, uniqueness: true
  has_many :posts
  has_many :posts, through: :post_talent_tags

end
