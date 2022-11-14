Rails.application.routes.draw do
  root 'home#index'

  mount ActionCable.server => '/cable'

  namespace :v1 do
    resources :posts
  end

  namespace :v2 do
    resources :posts
  end

  namespace :v3 do
    resources :posts
  end

  namespace :v4 do
    resources :posts
  end
end
