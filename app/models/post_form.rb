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

    # def update(params, post)
      #一度タグの紐付けを消す
      # post.post_tag_relations.destroy_all
  
      #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
      # tag_name = params.delete(:tag_name)
  
      #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
      # tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
  
      #タグを保存
      # tag.save if tag_name.present?
      # post.update(params)
      # PostTagRelation.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
    # end
  end
end