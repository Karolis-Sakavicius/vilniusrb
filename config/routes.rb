Rails.application.routes.draw do
  root 'home#index'

  namespace :v1 do
    resources :posts
  end
end
