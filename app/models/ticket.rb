class Ticket < ActiveRecord::Base
	has_many :infractions
	belongs_to :user
end
