class Admin < ActiveRecord::Base

	validates_presence_of :email 
    has_secure_password

    def self.authenticate(email, password)
  		Admin.find_by(email: email).try(:authenticate, password)
    end
end
