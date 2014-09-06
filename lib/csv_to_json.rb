require 'csv'
require 'json'
require_relative 'stock_items_import_utils'
include StockItemsImportUtils

if ARGV.count == 1
	puts stock_items_csv_to_json(ARGV.first)
elsif ARGV.count == 0
	puts "Please enter a valid csv file."
else
	puts "Please only enter one csv file."
end