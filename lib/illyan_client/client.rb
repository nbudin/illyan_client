require 'faraday'
require 'faraday_middleware'

module IllyanClient
  class Client
    attr_reader :base_url, :token
    
    def initialize(base_url: nil, token: nil)
      @base_url = base_url || IllyanClient.base_url
      @token = token || IllyanClient.token
    end
    
    def connection
      @connection ||= Faraday.new(url: base_url) do |faraday|
        faraday.request :basic_auth, token, ''
        faraday.request :json
        
        faraday.response :json
        faraday.response :logger
        
        faraday.adapter Faraday.default_adapter
      end
    end
    
    def find_person(id)
      response = connection.get "/admin/people/#{id}"
      IllyanClient::Person.new(response['person'])
    end
    
    def create_person(person)
      connection.post "/admin/people", person.serializable_hash
    end
  end
end