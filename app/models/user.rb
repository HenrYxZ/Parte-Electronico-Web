class User < ActiveRecord::Base
	has_many :tickets
	has_secure_password
	has_one :api_key, dependent: :destroy
	after_create :create_api_key

	validates_presence_of :username, :password, :first_name, :last_name, :rank 
	validates_uniqueness_of :username

	private
	def create_api_key
		ApiKey.create(user: self) 
	end
end
