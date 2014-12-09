#!/usr/bin/ruby
require_relative 'credit_card_processing'
require_relative "database_manager"
@data_storage = {}

def parse_data(new_data, data_storage)

	new_data.each_line do |line, index|

		line = line.split(' ')
		function = line[0]

		case function

		when 'Add'

			name, cc, limit = line[1..-1]
			limit = limit[1..-1].to_i

			data_storage[name] = CreditCardProcessing.new(name, cc, limit)
			validity = @data_storage[name].valid().to_s

			@accounts.insert(:name => name, :card_validity => validity, :limit => limit, :balance => 0)

		when 'Charge'

			name, amount = line[1..-1]
			amount = amount[1..-1].to_i

			if data_storage[name].nil?
				puts "Could not find #{name}"
			else
				new_balance = @data_storage[name].charge(amount)

				@accounts.where(:name => name).update(:balance => new_balance)
			end

		when 'Credit'

			name, amount = line[1..-1]
			amount = amount[1..-1].to_i

			if data_storage[name].nil?
				puts "Could not find #{name}"
			else
				new_balance = @data_storage[name].credit(amount)

				@accounts.where(:name => name).update(:balance => new_balance)
			end

		end

	end

end