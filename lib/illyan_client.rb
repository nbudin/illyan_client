require "illyan_client/version"
require "illyan_client/client"
require "illyan_client/person"

module IllyanClient
  mattr_reader :base_url, :token
  
  def self.base_url=(url)
    @@base_url = url
  end
  
  def self.token=(token)
    @@token = token
  end
  
  def self.configure!
    yield IllyanClient
  end
  
  def self.default_client
    @default_client ||= IllyanClient::Client.new
  end
end