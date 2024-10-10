Rails.application.routes.draw do
  root to: 'posts#index' #ルートパスの指定
  
  resources :posts, only: :index
end
