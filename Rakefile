require 'rake/testtask'
Rake::TestTask.new

task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end
