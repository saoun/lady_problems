Rails.application.routes.draw do
  resources :feedbacks
  resources :pitches
  resources :users

  resources :boards do
    resources :posts
  end


  resources :comments







  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
end
