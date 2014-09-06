require 'csv'
require 'json'
require_relative 'import_utils'
include ImportUtils

puts csv_to_json("example.csv")