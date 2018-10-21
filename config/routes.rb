Rails.application.routes.draw do
  resources :demos
  root "main#new"
  get "/users", to: "users#index"
  get "/admin", to: "session#admin"
  get "/edit", to: "users#edit"
  get "/new", to: "session#new"
  post "/login", to: "session#login"
  get "/login", to: "session#login"
  get "/logout", to: "session#logout"
  get "/register", to: "users#new"
  post "/signup", to: "users#create"
  get "/show" , to: "users#show"
  get "/recover", to: "session#recover"
  post "/reset", to: "session#reset"
  delete "/delete", to: "users#destroy"
  resources :users
end
