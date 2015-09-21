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
      @connection ||= Faraday.new(url: base_url, headers: {'Accept' => 'application/json'}) do |conn|
        conn.request :basic_auth, token, ''
        conn.request :json
        
        conn.response :json
        conn.response :logger
        
        conn.adapter Faraday.default_adapter
      end
    end
    
    def create_person(person)
      connection.post "/admin/people", { person: person.serializable_hash }
    end
  end
end