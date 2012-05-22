require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
	t.pattern = "test/**/*_spec.rb"
end

task :default  => :spec