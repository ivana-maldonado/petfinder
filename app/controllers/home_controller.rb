class HomeController < ApplicationController

    def index
        @pet_service = FetchDataService.new
        @pet_service.hello
    end
end
