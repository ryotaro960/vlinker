Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index' #ルートパスの指定
  
  resources :posts, only: :index
end
