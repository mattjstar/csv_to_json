require 'csv'
require 'json'
require_relative 'import_utils'
include ImportUtils

if ARGV.count == 1
	puts csv_to_json(ARGV.first)
elsif ARGV.count == 0
	puts "Please enter a valid csv file."
else
	puts "Please only enter one csv file."
end