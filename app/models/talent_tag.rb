class TalentTag < ApplicationRecord

  validates :talent_tag_name, uniqueness: true
  has_many :post_talent_tags
  has_many :posts, through: :post_talent_tags

  def self.ransackable_attributes(auth_object = nil)
    ["talent_tag_name"]
  end
end
