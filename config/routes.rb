Rails.application.routes.draw do
  resources :users

  resources :boards do
    resources :posts, :comments
  end

  # do
  #   resources :comments
  # end

  resources :pitches do
    resources :feedbacks
  end


  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
end
