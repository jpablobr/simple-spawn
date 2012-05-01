#!/usr/bin/env rake
require 'rake'
require 'rake/testtask'
require 'bundler/gem_tasks'

namespace :test do
  Rake::TestTask.new do |t|
    t.name = "minitest"
    t.libs << "test"
    t.test_files = FileList['test/simple/test_*.rb', 'test/test_*.rb']
    t.verbose = true
  end
end

task :default => "test:minitest"
