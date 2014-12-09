class CreditCardProcessing
# a program that will add new credit card accounts, process
# charges and credits against them, and display summary information

	def initialize(name, cc, limit = 0, balance = 0)

		@luhn_check = luhn_check(name, cc)

		case @luhn_check

		when true

			@name = name
			@limit = limit
			@balance = balance
			puts "#{name}'s account has been created!"

		when false

			@name = name
			@limit = limit
			@balance = balance


		end

	end

	def balance()

		puts "#{@name} $#{@balance}"
		@balance
		
	end

	def limit()

		puts "#{@name} $#{@limit}"
		@limit
		
	end

	def valid()

		puts "#{@name} $#{@luhn_check}"
		@luhn_check
		
	end

	def charge(amount)

		if @luhn_check == false
			puts "#{@name}'s credit card number was invalid, no charge processed."
		elsif amount + @balance > @limit
			puts "#{@name}'s charge for $#{amount} was declined."
		else
			@balance += amount
			puts "#{@name}'s charged $#{amount}, balance is now $#{@balance}"
			@balance
		end

	end

	def credit(amount)

		if @luhn_check == false
			puts "#{@name}'s credit card number was invalid, no credit processed."
		else
			@balance -= amount
			puts "#{@name}'s credited $#{amount}, balance is now $#{@balance}"
			@balance
		end

	end

	def luhn_check(name, cc)

		digits = cc.scan(/./).map(&:to_i) # creates an array of ints
		compare = digits.pop # pops off the last index to be compared later

		sum = digits.reverse.each_slice(2).map do |num, index| # reversed array and then executes methods
			[(num * 2).divmod(10), index || 0] # multiplies every other num by 2
		end.flatten.inject(:+) # puts into sum

		check = (10 - sum % 10) == compare # if last digit = 10 - sum modulus 10 == true

		if cc.length > 19
			puts "#{name}'s credit card number was out of bounds"
		elsif check == false
			puts "#{name}'s credit card number was invalid"
		end

		check

	end

end