Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  post "/artists", to: "artists#create"
  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:artist_id", to: "artists#show"
  patch "/artists/:artist_id", to: 'artists#update'
  delete "/artists/:artist_id", to: 'artists#destroy'

  get "/paintings", to: "paintings#index"
  get "/paintings/:painting_id/edit", to: 'paintings#edit'
  get "/paintings/:painting_id", to: "paintings#show"
  patch "/paintings/:painting_id", to: 'paintings#update'
  delete "/paintings/:painting_id", to: 'paintings#destroy'
  

  get "/artists/:artist_id/edit", to: "artists#edit"
  get "/artists/:artist_id/paintings/new", to: "artist_paintings#new"
  get "/artists/:artist_id/paintings", to: "artist_paintings#index"
  post "/artists/:artist_id/paintings", to: "artist_paintings#create"
end
