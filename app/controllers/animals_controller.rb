class AnimalsController < ApplicationController

  def index
    @params = params.permit(:type, :age, :size, :location, :limit)
    @pets = PetDataService.getPets(@params)
  end

  def show
    id = params["id"]
    @pet = PetDataService.getPet(id)
    addPetToFavoritesDb(id)
  end

  def addPetToFavorites
    pet = PetDataService.getPet(params["pet_id"])
    favorite = FavoritePet.new
    favorite.user_id = current_user.id
    favorite.name = pet["name"]
    favorite.image_url = (pet["photos"].count > 0) ? pet["photos"][0]["medium"] : "dog.jpg"
    favorite.pet_id = params["pet_id"]
    favorite.save
    puts favorite
  end

  def addPetToFavoritesDb(pet_id)
    pet = PetDataService.getPet(pet_id)
    favorite = FavoritePet.new
    favorite.user_id = current_user.id
    favorite.name = pet["name"]
    favorite.image_url = (pet["photos"].count > 0) ? pet["photos"][0]["medium"] : "dog.jpg"
    favorite.pet_id = pet["pet_id"]
    favorite.save
  end
end

