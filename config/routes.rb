Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "home#index"
  resources :animals, only: [:index, :show]
  post "/animals/favorite/:pet_id", to: "animals#addPetToFavorites", :as => :add_pet_favorites 

  resources :shelters, only: [:index, :show]
  
  resources :favorite_pets, only: [:index, :create, :destroy]
end
