Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:id", to: "artists#show"
  get "/paintings", to: "paintings#index"
  get "/paintings/:id", to: "paintings#show"
  get "/artists/:artist_id/paintings", to: "artist_paintings#index"
  post "/artists", to: "artists#create"
end
