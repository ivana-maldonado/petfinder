class AnimalsController < ApplicationController

  def index
    @params = params.permit(:type, :age, :size, :location, :limit)
    @pets = PetDataService.getPets(@params)
  end

  def show
    id = params["id"]
    @pet = PetDataService.getPet(id)
  end
end
