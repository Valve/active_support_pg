#!/usr/bin/env rake
require 'pg'
require 'yaml'
require 'rake/testtask'
require_relative 'tests/test_helper'

Rake::TestTask.new do |t|
  t.pattern = 'tests/*_test.rb'
end

task :setup do
  sql = read_library_code
  exec_sql(sql)
  puts "created all functions in the `#{db_config['dbname']}` database."
end

