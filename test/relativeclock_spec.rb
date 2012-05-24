require 'singapore_relative_clock'

describe SingaporeRelativeClock do
	before(:all) do
		@clock = SingaporeRelativeClock.new
	end

	it "should return 0 if the city is in the same timezone as Singapore" do
		@clock.timeDifferenceTo("Kuala Lumpur").should === 0
	end

	it "should return a negative number if the city is ahead of Singapore's timezone" do
		@clock.timeDifferenceTo("Sydney").should be > 0
	end

	it "should return the difference in hours" do
		@clock.timeDifferenceTo("Adelaide").should be == 1.5 
	end

	it "should return a positive number if the city is behind of Singapore's timezone" do
		@clock.timeDifferenceTo("London").should be < 0
	end
	
	it "should return an error if the city is unrecognized" do
		lambda{@clock.timeDifferenceTo("Koala Lumpy")}.should raise_error
	end
	
	it "should return an error if the city is missing" do
		lambda{@clock.timeDifferenceTo()}.should raise_error
	end
end