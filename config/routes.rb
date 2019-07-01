Rails.application.routes.draw do
  root 'parks#index'
  devise_for :users

  resources :parks, path: "parks", only: [:index, :show]


  namespace :api do
    namespace :v1 do
      resources :parks, path: "parks", only: [:index, :show]
    end
  end

end
