class SingaporeRelativeClock
	def initialize
		@finder = TimezoneFinder.new
	end

	def timeDifferenceTo(city)
		singaporeGMTOffset = Time.new.utc_offset / 60 / 60

		@finder.findOffsetFor(city) - singaporeGMTOffset
	end

end