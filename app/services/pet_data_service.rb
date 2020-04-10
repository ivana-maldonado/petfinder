require 'net/http'
require 'uri'
require 'byebug'

class PetDataService

    def self.getPets(filter = {})
        query = filter.to_query
        # uri = https://api.petfinder.com/v2/animals?type=dog
        data = httpGet("animals?#{query}")
        data["animals"]
    end

    def self.getPet(id)
        # https://api.petfinder.com/v2/animals/47753507
        data = httpGet("animals/#{id}")
        data["animal"]
    end

    def self.getShelters(filter = {})
        query = filter.to_query
        #uri = https://api.petfinder.com/v2/organizations?location=waltham, ma
        data = httpGet("organizations?#{query}")
        data["organizations"]
    end

    def self.getShelter(id)
        # https://api.petfinder.com/v2/organizations/SC396
        data = httpGet("organizations/#{id}")
        data["organization"]
    end

    def self.getBreeds
        # https://api.petfinder.com/v2/types/dog/breeds
        data = httpGet("types/dog/breeds")
        data["breeds"]
    end

    def self.getAnimalsByShelterId(shelterId)
        filter = { :organization => shelterId }
        query = filter.to_query
        # https://api.petfinder.com/v2/animals?organization=SC396
        data = httpGet("animals?#{query}")
        data["animals"]
    end


    @@token = nil

    def self.getToken
        # TODO: add additional logic to check if the token is older than 1 hour

        return @@token if @@token
        
        uri = URI.parse("https://api.petfinder.com/v2/oauth2/token")
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(
            "client_id" =>  "LTuRaLAmXWvxqgzynDgf7R6rFJMtykW98o4JDTtfXhxNLtASAg",
            "client_secret" => "W6749Pe32WUFjITSHnYoIDDm3Hex7MWk2gh47NiD",
            "grant_type" => "client_credentials",
        )

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true 

        response = http.request(request)    
        
        data  = JSON.parse response.read_body
        @@token = "Bearer " + data["access_token"]

    end    

    def self.httpGet(endpoint)
        uri = URI.parse("https://api.petfinder.com/v2/#{endpoint}")
        puts "--> httpGet: #{uri.to_s}"
        request = Net::HTTP::Get.new(uri)
        request["Authorization"] = getToken

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        response = http.request(request)

        data = JSON.parse response.read_body
    end

    private_class_method :httpGet

end
