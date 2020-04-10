class SheltersController < ApplicationController
  def index
    @params = params.permit(:name, :address)
    @shelters = PetDataService.getShelters(@params)
  end

  def show
    id = params["id"]
    @shelter = PetDataService.getShelter(id)

    PetDataService.getAnimalsByShelterId(shelterId)
  end
end
