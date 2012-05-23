require 'csv'

class TimezoneFinder
	Struct.new("TimezoneDatum", :name, :gmt_offset) 

	@zones = nil

	def initialize timezone_file
		@timezone_file = timezone_file
	end

	def load_zones
		@zones = []
		CSV.foreach(@timezone_file, :headers => :first_line) do |row|
			@zones << Struct::TimezoneDatum.new(row.field("timeZoneId"), row.field("rawOffset"))
		end

		@zones
	end

	def zones
		@zones ||= load_zones
	end
end

finder = TimezoneFinder.new "../data/timezones.txt"
p finder.zones.count