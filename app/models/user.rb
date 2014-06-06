class User < ActiveRecord::Base
	has_many :tickets
	has_secure_password

	validates_presence_of :username, :password, :first_name, :last_name, :rank 
	validates_uniqueness_of :username
end
