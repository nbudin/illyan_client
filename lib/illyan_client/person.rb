require 'active_model'

module IllyanClient
  class Person
    include ActiveModel::Model
    attr_accessor :id, :firstname, :lastname, :gender, :birthdate, :email, :admin
    
    def persisted?
      id
    end
    
    def attributes
      {
        id: id,
        firstname: firstname,
        lastname: lastname,
        gender: gender,
        birthdate: birthdate,
        email: email,
        admin: admin
      }
    end
  end
end