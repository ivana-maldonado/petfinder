class HomeController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        # result = PetDataService.getShelters({
        #     :location => "waltham, ma"
        # })
        # puts result
        
        # result = PetDataService.getShelter("SC396")
        # puts result

        # result = PetDataService.getBreeds
        # puts result

        result = PetDataService.getAnimalsByShelterId({
            :organization => "TX851",
        })
        puts result
    end
end
