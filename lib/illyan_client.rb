require 'active_resource'

module IllyanClient
  def self.base_url=(url)
    Person.site = "#{url}/admin"
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