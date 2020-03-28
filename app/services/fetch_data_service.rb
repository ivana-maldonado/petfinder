require 'net/http'
require 'uri'
require 'byebug'

class FetchDataService
    TOKEN = ""
    
    def initialize
        blah = getToken
        data = JSON.parse blah.read_body
        TOKEN = data.access_token

    end

    def hello
        puts "hello"
    end

    def getToken
        uri = URI.parse("https://api.petfinder.com/v2/oauth2/token")
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(
            "client_id" =>  "---",
            "client_secret" => "---",
            "grant_type" => "client_credentials",
        )
        
        req_options = {
            use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
            http.request(request)
        end

    end


end
