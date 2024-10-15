class PostsController < ApplicationController

  def index  
    @posts = Post.all
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  
  def post_form_params
    params.require(:post_form).permit(:movie_main, :movie_main_embedded, :movie_main_thumbnail, :movie_left, :movie_left_embedded, :movie_right, :movie_right_embedded, :talent_name, :talent_belongs, :talent_channel, :talent_x, :talent_hp, :message, :movie_tag_name, :talent_tag_name, :talent_image).merge(user_id: current_user.id)
  end

end
