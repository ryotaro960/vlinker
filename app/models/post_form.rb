class PostForm
  include ActiveModel::Model

  attr_accessor :user_id, :movie_main, :movie_main_embedded, :movie_main_thumbnail, :movie_left, :movie_left_embedded, :movie_right, :movie_right_embedded, :talent_image, :talent_name, :talent_belongs, :talent_channel, :talent_x, :talent_hp, :message, :movie_tag_name, :talent_tag_name, :id, :created_at, :updated_at

  validates :movie_main, presence: true
  validates :movie_main_embedded, presence: true
  validates :movie_main_thumbnail, presence: true
  validates :talent_name, presence: true, length: { maximum: 20}
  validates :user_id, presence: true
  validates :message, length: { maximum: 250}

  def save
    post = Post.create(user_id: user_id, movie_main: movie_main, movie_main_embedded: movie_main_embedded, movie_main_thumbnail: movie_main_thumbnail, movie_left: movie_left, movie_left_embedded: movie_left_embedded, movie_right: movie_right, movie_right_embedded: movie_right_embedded, talent_image: talent_image, talent_name: talent_name, talent_belongs: talent_belongs, talent_channel: talent_channel, talent_x: talent_x, talent_hp: talent_hp, message: message)
    
    if movie_tag_name.present?
      movie_tags = movie_tag_name.split('`/$').map(&:strip)
      movie_tags.each do |movie_tag|
        movie_tag = MovieTag.where(movie_tag_name: movie_tag).first_or_initialize
        movie_tag.save
        PostMovieTag.create(post_id: post.id, movie_tag_id: movie_tag.id)
      end
    end

    if talent_tag_name.present?
      talent_tags = talent_tag_name.split('`/$').map(&:strip)
      talent_tags.each do |talent_tag|
        talent_tag = TalentTag.where(talent_tag_name: talent_tag).first_or_initialize
        talent_tag.save
        PostTalentTag.create(post_id: post.id, talent_tag_id: talent_tag.id)
      end
    end
  end

  def update(params, post)
    post.post_movie_tags.destroy_all
    post.post_talent_tags.destroy_all
    movie_tag_name = params.delete(:movie_tag_name)
    talent_tag_name = params.delete(:talent_tag_name)
    post.update(params)

    if movie_tag_name.present?
      movie_tags = movie_tag_name.split('`/$').map(&:strip)
      movie_tags.each do |movie_tag|
        movie_tag = MovieTag.where(movie_tag_name: movie_tag).first_or_initialize
        movie_tag.save
        PostMovieTag.create(post_id: post.id, movie_tag_id: movie_tag.id)
      end
    end

    if talent_tag_name.present?
      talent_tags = talent_tag_name.split('`/$').map(&:strip)
      talent_tags.each do |talent_tag|
        talent_tag = TalentTag.where(talent_tag_name: talent_tag).first_or_initialize
        talent_tag.save
        PostTalentTag.create(post_id: post.id, talent_tag_id: talent_tag.id)
      end
    end
  end
end