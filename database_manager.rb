require "sequel"

if File.file?("database.db") == false

	File.new("database.db", "w+")

	DB = Sequel.sqlite('database.db')

	DB.create_table :items do
		primary_key :id
		String :name
		String :credit_card
		Boolean :card_validity
		Integer :limit
		Integer :balance
	end

	@items = DB[:items]

	puts "Made a database"

end
	