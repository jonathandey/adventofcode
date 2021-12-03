def get_input
	# Get the file from the cli argument
	file = ARGV[0]
	if (file == nil)
		abort("Please provide an input")
	end
	begin
		# Split each newline then cast to an integer
		File.read(file).split("\n").map do |i| 
			# strip! returns nil if there is nothing to strip.. strangly
			i = i.strip! ? i.strip! : i
		end
	rescue StandardError => bang
		# catch any bad/missing file names
		abort("No file found named '#{file}'")
	end
end

def multiply(firstNum, secondNum)
	firstNum * secondNum
end

def power_consumption (input)
	gamma_rate  = []
	epsilon_rate = []

	grouping = []

	input.each do | line |
		# split each charater in the string (no spacing)
		digits = line.split(//)

		digits.each_with_index do | bit, bit_index |
			if grouping[bit_index] == nil
				grouping[bit_index] = []
			end

			# Coverting to an int for comparison later on
			grouping[bit_index].push(bit.to_i)
		end

	end

	grouping.each do | group |
		# count the number of time 1 appears
		positive = group.count {|x| x === 1}
		# count the number of time 0 appears
		negative = group.count {|x| x === 0}

		gamma_rate.push(
			positive > negative ? 1 : 0
		)
		epsilon_rate.push(
			positive > negative ? 0 : 1
		)
	end

	multiply(
		# Convert the binary number to base 2
		gamma_rate.join.to_i(2),
		epsilon_rate.join.to_i(2)
	)

end

puts power_consumption(get_input)