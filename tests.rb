require 'csv'
require 'json'
require_relative 'lib/stock_items_import_utils'
include StockItemsImportUtils

working_dir = File.dirname(__FILE__)
example_csv = "#{working_dir}/example.csv"
example_json = "#{working_dir}/example.json"

method_output = stock_items_csv_to_json(example_csv)
json_output = File.read(example_json)

fail "Failed 'output json with stock items csv file'" unless json_output == method_output

############################################################################

example_csv_string = "item id,description,price,cost,price_type,quantity_on_hand,modifier_1_name,modifier_1_price,modifier_2_name,modifier_2_price,modifier_3_name,modifier_3_price 
111010,Coffee,$1.25,$0.80,system,100000,Small,-$0.25,Medium,$0.00,Large,$0.30 
111784,Delivery,,,open
111022,Bagel,$3.45,$2.00,system,9855,Cream Cheese,$1.00
2847224,Orange Juice 48,$68.57,,system,0,Small,$0.00,Medium,$1.00,Large,$2.50 
2847225,Milk 49,$70.00,49,system,510
2847226,Ciabatta 50,$71.43,,system,0
2847227,baguette 51,$0.00,,open,0
2847228,Sour Dough Boule 52,$74.29,,system,0
2847244,Whole Coffee Cake 68,$0.00,,open,0
2847229,Country Wht Boule 53,$75.71,,system,0
2847230,Semolina Batard 54,$77.14,,system,0
2847231,Multigrain Batard 55,$78.57,,system,0
2847232,Focaccia 56,$80.00,56,system,440
2847233,Rolls 57,$81.43,,system,0,Jelly,$.75,Peanut Butter,$1.12"

method_output = stock_items_csv_to_json(example_csv_string)
json_output = File.read(example_json)

fail "Failed 'output json with stock items csv string'" unless json_output == method_output

############################################################################

puts "All Tests Passing!"