require 'rspec/core/rake_task'
require File.expand_path('../src/rovers', __FILE__)

RSpec::Core::RakeTask.new(:spec)

desc "Start the rovers"
task :default do
  rovers = Rovers.new "5 5 1 2 N LMLMLMLMM 3 3 E MMRMMRMRRM"
  rovers.start
end
