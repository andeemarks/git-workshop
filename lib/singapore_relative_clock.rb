require_relative 'gmt_offset_finder'

class SingaporeRelativeClock
	def initialize
		@finder = GMTOffsetFinder.new
	end

	def timeDifferenceTo(city)
		singaporeGMTOffset = Time.new.utc_offset / 60 / 60

		@finder.offsetFor(city) - singaporeGMTOffset
	end

end