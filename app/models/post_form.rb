class PostForm
  include ActiveModel::Model

  attr_accessor :user_id, :movie_main, :movie_main_thumbnail, :movie_left, :movie_left_thumbnail, :movie_right, :movie_right_thumbnail, :talent_image, :talent_name, :talent_belongs, :talent_channel, :talent_x, :talent_hp, :message

  validates :movie_main, presence: true
  validates :movie_main_thumbnail, presence: true
  validates :talent_name, presence: true, length: { maximum: 30}

  def save
    Post.create(user_id: user_id, movie_main: movie_main, movie_main_thumbnail: movie_main_thumbnail, movie_left: movie_left, movie_left_thumbnail: movie_left_thumbnail, movie_right: movie_right, movie_right_thumbnail: movie_right_thumbnail, talent_image: talent_image, talent_name: talent_name, talent_belongs: talent_belongs, talent_channel: talent_channel, talent_x: talent_x, talent_hp: talent_hp, message: message)
  end

end