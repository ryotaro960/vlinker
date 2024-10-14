class PostTalentTag < ApplicationRecord

  belongs_to :post
  belongs_to :talent_tag

end
