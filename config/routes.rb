Rails.application.routes.draw do
  resources :feedbacks
  resources :boards
  resources :comments
  resources :posts
  resources :pitches
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
