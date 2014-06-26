class Ticket < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper
	has_and_belongs_to_many :infractions
	has_many :pictures
	belongs_to :user


	def add_infractions (jsonInfractions)
		jsonInfractions.each do |jsonInfraction|
			infraction = Infraction.find_by_type_of_infraction(jsonInfraction["type"])
			#if (infraction and (infraction.cost == jsonInfractions["value"]))
			if infraction
				self.infractions << infraction
			else
				infraction = Infraction.new()
				infraction.type_of_infraction = jsonInfraction["type"]
				infraction.cost = jsonInfraction["value"]
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
			picture = Picture.new()
			picture.file_name = jsonPicture["fileName"]
			picture.format = jsonPicture["type"]
			if picture.save
				self.pictures << picture
			else
				render json: picture.errors, status: :unprocessable_entity
			end
		end
	end

	def total_cost
		total = 0
		infractions.each do |infraction|
			total = total + infraction.cost
		end
		return number_to_currency(total, delimiter: ".", precision: 0)
	end
end
