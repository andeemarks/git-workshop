require_relative 'gmt_offset_finder'

class SingaporeRelativeClock
	SGT_OFFSET = "+08:00"
	
	def initialize
		@finder = GMTOffsetFinder.new
	end

	def timeDifferenceTo(city)
		singaporeGMTOffset = Time.new.getlocal(SGT_OFFSET).utc_offset / 60 / 60

		@finder.offsetFor(city) - singaporeGMTOffset
	end

end