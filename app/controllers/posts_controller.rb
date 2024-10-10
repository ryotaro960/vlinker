class PostsController < ApplicationController
  def index
    root to: 'posts#index' #ルートパスの指定
  end
end
