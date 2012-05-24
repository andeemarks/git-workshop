require 'timezone_finder'

describe TimezoneFinder do
	before(:all) do
		@tf = TimezoneFinder.new
	end

	it "should find the GMT offset for a known city" do
		@tf.findOffsetFor("Melbourne").should_not be_nil
	end

	it "should find the GMT offset for a known city with embedded spaces" do
		@tf.findOffsetFor("New York").should_not be_nil
	end

	it "should find the GMT offset for a known city with surrounding spaces" do
		@tf.findOffsetFor("Rome  ").should_not be_nil
		@tf.findOffsetFor("  Rome  ").should_not be_nil
	end

	it "should treat cities in a case insensitive manner" do
		@tf.findOffsetFor("melbourne").should_not be_nil
		@tf.findOffsetFor("MELBOURNE").should_not be_nil
		@tf.findOffsetFor("MeLBOurNE").should_not be_nil
	end

	it "should return numeric offset for a known city" do
		@tf.findOffsetFor("Melbourne").should be_a_kind_of Numeric
	end

	it "should return correct offset for a known city" do
		@tf.findOffsetFor("Melbourne").should === 10.0
	end

	it "should error on an unknown city" do
		lambda{@tf.findOffsetFor("Atlantis")}.should raise_error
	end
end