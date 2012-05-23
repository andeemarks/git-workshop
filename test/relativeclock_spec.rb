require 'singapore_relative_clock'

describe SingaporeRelativeClock do
	before(:all) do
		@clock = SingaporeRelativeClock.new
	end

	it "should return 0 if the city is in the same timezone as Singapore" do
		@clock.timeIn("Kuala Lumpur").should === 0
	end

	it "should return a negative number if the city is ahead of Singapore's timezone" do
		@clock.timeIn("Sydney").should be < 0
	end

	it "should return a positive number if the city is behind of Singapore's timezone" do
		@clock.timeIn("London").should be > 0
	end
	
	it "should return an error if the city is unrecognized" do
		lambda{@clock.timeIn("Koala Lumpy")}.should raise_error
	end
end