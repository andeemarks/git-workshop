require 'singapore_relative_clock'

describe SingaporeRelativeClock do
	before(:all) do
		@clock = SingaporeRelativeClock.new
	end

	it "should be the same time if you ask for Singapore" do
		@clock.timeIn(:singapore).should == @clock.timeInSingapore
	end

	it "should be the same time if you ask for another country in the same timezone as Singapore" do
		@clock.timeIn(:brisbane).should == @clock.timeInSingapore
	end
end