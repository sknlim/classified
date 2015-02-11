Rails.application.routes.draw do
  devise_for :users
  resources :listings do
  	member do
  		put "like", to: "listings#upvote"
  	end
  end

  root "listings#index"
end
