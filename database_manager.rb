require "sequel"

# class DatabaseManager

# 	def createDB()

		if File.file?("database.db") == false

			File.new("database.db", "w+")

			DB = Sequel.sqlite('database.db')

			DB.create_table :accounts do
				primary_key :id
				string :name
				string :credit_card
				string :card_validity
				integer :limit
				integer :balance
			end

			@accounts = DB[:accounts]

			puts "Made a database"

		# else

		# 	print "Would you like to delete the database (y/n)? "
		# 	input = gets.chomp

		# 	if input == 'y'
		# 		File.new("database.db", "w+")
		# 	elsif input == 'n'
				
		# 	else
		# 		puts "Not a valid option"
		# 	end
				

		end

# 	end
	
# end