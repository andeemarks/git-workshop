require 'sinatra' 

require_relative '../lib/singapore_relative_clock.rb'

get '/' do
	"Try using me like... #{request.url}city/Singapore"
end

get '/city/:city' do
	@clock = SingaporeRelativeClock.new

	city = params[:city]
	"The time difference from Singapore to #{city} is #{@clock.timeDifferenceTo(city)} hours"
end

get '/favicon.ico' do 
end
