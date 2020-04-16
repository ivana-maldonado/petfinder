class FavoritePetsController < ApplicationController
  def index
    # @favorite_pet = FavoritePet.all
    @favorite_pet = FavoritePet.where(:user => current_user.id)
  end

  # def create
  #   @favorite_pet = FavoritePet.new(favorites_params)
  #   byebug
  #   @favorite_pet.user = current_user
  #   @favorite_pet.save
  # end

  def create  
    petID = params["petID"]
    @favorite_pet = FavoritePet.new(:id => params["petID"])
    @favorite_pet.user = current_user
    @favorite_pet.save
  end

  def destroy
    @favorite_pet = FavoritePet.find(params[:id])
    @favorite_pet.destroy

    redirect_to favorite_pets_path
  end



  # private

  # def favorites_params
  #   params.require(:favorite_pet).permit(:name, :image_url, :pet_id)
  # end
end
