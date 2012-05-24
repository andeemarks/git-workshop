require 'csv'

class TimezoneFinder
	Struct.new("TimezoneDatum", :name, :gmt_offset) 

	@zones = nil

	def initialize
		@timezone_file = "./data/timezones.txt"
	end

	def load_zones
		@zones = []
		CSV.foreach(@timezone_file, :headers => :first_line) do |row|
			@zones << Struct::TimezoneDatum.new(row.field("timeZoneId").downcase, row.field("rawOffset"))
		end

		@zones
	end

	def zones
		@zones ||= load_zones
	end

	def findOffsetFor(city)
		city_to_match = city.strip.downcase.sub(" ", "_")

		cities = zones.select{|zone| zone[:name].split('/')[1] === city_to_match}

		raise "cannot find offset for #{city}" if cities.nil? || cities.length < 1

		cities[0][:gmt_offset].to_f
	end
end
