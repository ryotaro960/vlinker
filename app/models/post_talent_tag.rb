class PostTalentTag < ApplicationRecord

  validates :post, presence: true
  validates :talent_tag, presence: true

  belongs_to :post
  belongs_to :talent

end
