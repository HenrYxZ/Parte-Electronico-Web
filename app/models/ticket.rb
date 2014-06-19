class Ticket < ActiveRecord::Base
	has_and_belongs_to_many :infractions
	belongs_to :user

	def add_infractions (jsonInfractions)

		jsonInfractions.each do |jsonInfraction|
			infraction = Infraction.find_by_type(jsonInfraction["type"])
			if (infraction and (infraction.cost == jsonInfractions["value"]))
				self.infractions << infraction
			else
				infraction = Infraction.new()
				infraction.type = jsonInfraction["type"]
				infraction.cost = jsonInfractions["value"]
				if infraction.save
					self.infractions << infraction
				else
					render json: infraction.errors, status: :unprocessable_entity
				end
			end
		end
	end 
	
	def add_pictures (jsonPictures)

		jsonPictures.each do |jsonPicture|
		end
	end
end
