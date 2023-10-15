Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:artist_id", to: "artists#show"
  get "/paintings", to: "paintings#index"
  get "/artists/:artist_id/edit", to: "artists#edit"
  get "/artists/:artist_id/paintings/new", to: "artist_paintings#new"
  get "/artists/:artist_id/paintings", to: "artist_paintings#index"
  post "/artists/:artist_id/paintings", to: "artist_paintings#create"
  post "/artists", to: "artists#create"
  patch "/artists/:artist_id", to: 'artists#update'
  get "/paintings/:painting_id/edit", to: 'paintings#edit'
  get "/paintings/:painting_id", to: "paintings#show"
  patch "/paintings/:painting_id", to: 'paintings#update'
end
