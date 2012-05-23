require 'timezone_finder'

describe TimezoneFinder do
	before(:all) do
		@tf = TimezoneFinder.new
	end

	it "should find the GMT offset for a known city" do
		@tf.findOffsetFor("Melbourne").should_not be_nil
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