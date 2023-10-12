Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/artists", to: "artists#index"
  get "/artists/:id", to: "artists#show"
end
