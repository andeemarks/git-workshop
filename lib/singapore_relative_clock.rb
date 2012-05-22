class SingaporeRelativeClock
	def timeIn(country)
		if country === :singapore 
			timeInSingapore
		end
	end

	def timeInSingapore
		now = Time.new
		now.strftime("%a %d %X%p") + " " + now.zone
	end
end