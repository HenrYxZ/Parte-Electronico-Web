class Infraction < ActiveRecord::Base
	has_and_belongs_to_many :tickets
end
