class User < ActiveRecord::Base
	has_many :tickets
  	has_many :infractions, through: :tickets
	# has_secure_password
	has_one :api_key, dependent: :destroy
	before_save :create_pass_digest
	after_create :create_api_key
	validates_presence_of :username, :password, :first_name, :last_name, :rank 
	validates_uniqueness_of :username

	def authenticate(hashed_password)
	    if password_digest ==  hashed_password
	      # If they match we return the user 
	      return api_key.access_token
	    else
	     return nil
	    end
  	end

	  def create_pass_digest
	  	self.password_digest = Digest::SHA1.hexdigest password
	  end

	def access_token
		api_key.access_token
	end

	def name
		"#{rank} #{first_name} #{last_name}"
	end

	private
	def create_api_key
		ApiKey.create(user: self) 
	end
end
