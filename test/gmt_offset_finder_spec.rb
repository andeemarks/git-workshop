require 'gmt_offset_finder'

describe GMTOffsetFinder do
	before(:all) do
		@finder = GMTOffsetFinder.new
	end

	it "should find the GMT offset for a known city" do
		@finder.offsetFor("Melbourne").should_not be_nil
	end

	it "should find the GMT offset for a known city with embedded spaces" do
		@finder.offsetFor("New York").should_not be_nil
	end

	it "should find the GMT offset for a known city with surrounding spaces" do
		@finder.offsetFor("Rome  ").should_not be_nil
		@finder.offsetFor("  Rome  ").should_not be_nil
	end

	it "should treat cities in a case insensitive manner" do
		@finder.offsetFor("melbourne").should_not be_nil
		@finder.offsetFor("MELBOURNE").should_not be_nil
		@finder.offsetFor("MeLBOurNE").should_not be_nil
	end

	it "should return numeric offset for a known city" do
		@finder.offsetFor("Melbourne").should be_a_kind_of Numeric
	end

	it "should return correct offset for a known city" do
		@finder.offsetFor("Melbourne").should === 10.0
	end

	it "should error on an unknown city" do
		lambda{@finder.offsetFor("Atlantis")}.should raise_error
	end
end