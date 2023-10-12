Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/artists", to: "artists#index"
  get "/artists/:id", to: "artists#show"
  get "/paintings", to: "paintings#index"
  get "/paintings/:id", to: "paintings#show"
end
