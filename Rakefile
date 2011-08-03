require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

task :default => [:spec]

desc 'Run the code in spec'
RSpec::Core::RakeTask.new(:spec) do |t|
	t.pattern = "spec/**/*_spec.rb"
end

namespace :spec do
	if RUBY_VERSION < '1.9'
		desc 'Run the code in specs with RCov'
		RSpec::Core::RakeTask.new(:report) do |t|
			t.pattern = "spec/**/*_spec.rb"
			t.rcov = true
			t.rcov_opts = IO.readlines(File.join('spec', 'rcov.opts')).map {|line| line.chomp.split(" ") }.flatten
		end
	end
end
