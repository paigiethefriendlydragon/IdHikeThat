Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :parks, path: "parks", only: [:index, :show]
  resources :campsites, path: "campsites", only: [:index, :show]
  resources :hikes, path: "hikes", only: [:index, :show]
  resources :search, path: "search", only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :parks, path: "parks", only: [:index, :show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :campsites, path: "campsites", only: [:index, :show ]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :hikes, path: "hikes", only: [:index, :show ]
    end
  end
end
