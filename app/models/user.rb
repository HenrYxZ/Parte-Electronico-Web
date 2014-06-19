class User < ActiveRecord::Base
	has_many :tickets
	# has_secure_password
	has_one :api_key, dependent: :destroy
	before_save :create_pass_digest
	after_create :create_api_key
	validates_presence_of :username, :password, :first_name, :last_name, :rank 
	validates_uniqueness_of :username

	def self.authenticate(email, hashed_password)
      if user = find_by_email(email)
        # Then compare the provided password against the hashed one in the db.
        if password_digest ==  hashed_password
          # If they match we return the user 
          return user
        end
      end
      # If we get here it means either there's no user with that email, or the wrong
      # password was provided.  But we don't want to let an attacker know which. 
      return nil
    end

    def create_pass_digest
    	self.password_digest = Digest::SHA1.hexdigest password
    end

	private
	def create_api_key
		ApiKey.create(user: self) 
	end
end
