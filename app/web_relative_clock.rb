require 'sinatra' 

require_relative '../lib/singapore_relative_clock.rb'

get '/' do
	"Try using me like... #{request.url}city/Singapore"
end

get '/city/:city' do
	@clock = SingaporeRelativeClock.new

	city = params[:city]
	begin
		"The time difference from Singapore to #{city} is #{@clock.timeDifferenceTo(city)} hours"
	rescue RuntimeError
		"Sorry - could not find a city called #{city}.  Try again."
	end
end

get '/favicon.ico' do 
end
