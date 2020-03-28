Rails.application.routes.draw do
  root to: "home#index"
  resources :animals, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
