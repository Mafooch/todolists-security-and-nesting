Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end

  resources :sessions, only: [:new, :create, :destroy]
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"

  root to: "todo_lists#index"
end
