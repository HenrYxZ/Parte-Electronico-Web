class Ticket < ActiveRecord::Base
	has_and_belongs_to_many :infractions
	belongs_to :user

	def add_infractions (jInfractions)

		jInfractions.each do |jInfraction|
			infraction = Infraction.find_by_type(jInfraction["type"])
			if (infraction and (infraction.cost == jInfractions["value"]))
				self.infractions << infraction
			else
				infraction = Infraction.new()
				infraction.type = jInfraction["type"]
				infraction.cost = jInfractions["value"]
				if infraction.save
					self.infractions << infraction
				else
					render json: infraction.errors, status: :unprocessable_entity
				end
			end
		end
	end 
	
end
