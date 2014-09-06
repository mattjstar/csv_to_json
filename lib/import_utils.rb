module ImportUtils

	def parse_modifiers(row, modifier_columns)
		modifiers = []

		for i in 1..modifier_columns
			if row["modifier_#{i}_name"]
				modifiers.push(
					{
						name: row["modifier_#{i}_name"],
						price: row["modifier_#{i}_price"]
					}
				)
			end
		end

		return modifiers
	end

	def import_stock_items(csv_file)
		csv_text = File.open(csv_file, "r:ISO-8859-1")
		csv = CSV.parse(csv_text, :headers => true)
		items_array = []
		csv.each do |row|
			if row["item id"]
				items_array.push(
					{ 
						id: row["item id"], 
						description: row["description"],
						price: row["price"],
						cost: row["cost"],
						price_type: row["price_type"],
						quantity_on_hand: row["quantity_on_hand"],
						modifiers: parse_modifiers(row, 3)
					}
				)
			end
		end

		return items_array
	end

	def csv_to_json(file)
		JSON.pretty_generate(import_stock_items(file))
	end
end