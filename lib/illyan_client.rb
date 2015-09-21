require 'active_resource'
require "illyan_client/version"

module IllyanClient
  mattr_reader :base_url
  
  def self.base_url=(url)
    @@base_url = url
    Person.site = "#{url}/admin"
  end
  
  def self.token
    Person.user
  end
  
  def self.token=(token)
    Person.user = token
  end
  
  def self.configure!
    yield IllyanClient
  end
  
  class Person < ActiveResource::Base
    self.format = :json
  end
end