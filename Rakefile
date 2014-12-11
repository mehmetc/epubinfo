require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :console do
  sh "irb -I lib -r 'epubinfo'"
end

task :default => :spec