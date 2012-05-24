require 'gmt_offset_finder'

describe GMTOffsetFinder do
	before(:all) do
		@tf = GMTOffsetFinder.new
	end

	it "should find the GMT offset for a known city" do
		@tf.offsetFor("Melbourne").should_not be_nil
	end

	it "should find the GMT offset for a known city with embedded spaces" do
		@tf.offsetFor("New York").should_not be_nil
	end

	it "should find the GMT offset for a known city with surrounding spaces" do
		@tf.offsetFor("Rome  ").should_not be_nil
		@tf.offsetFor("  Rome  ").should_not be_nil
	end

	it "should treat cities in a case insensitive manner" do
		@tf.offsetFor("melbourne").should_not be_nil
		@tf.offsetFor("MELBOURNE").should_not be_nil
		@tf.offsetFor("MeLBOurNE").should_not be_nil
	end

	it "should return numeric offset for a known city" do
		@tf.offsetFor("Melbourne").should be_a_kind_of Numeric
	end

	it "should return correct offset for a known city" do
		@tf.offsetFor("Melbourne").should === 10.0
	end

	it "should error on an unknown city" do
		lambda{@tf.offsetFor("Atlantis")}.should raise_error
	end
end