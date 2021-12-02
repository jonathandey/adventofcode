def get_input
	# Get the file from the cli argument
	file = ARGV[0]
	if (file == nil)
		abort("Please provide an input")
	end
	begin
		# Split each newline then cast to an integer
		File.read(file).split.map do |i| 
			# strip! returns nil if there is nothing to strip.. strangly
			i = i.strip! ? i.strip! : i
			# Ensure it is an int
			i.to_i 
		end
	rescue StandardError => bang
		# catch any bad/missing file names
		abort("No file found named '#{file}'")
	end
end

def part_one (input)
	unless input.instance_of?(Array)
		abort("Input is expected to be an array")
	end

	if (input.count <= 0)
		abort("No data to run")
	end

	increases = 0
	previous = nil

	for i in input do
		if (previous != nil) && (i > previous) && i.instance_of?(Integer)
			increases += 1
		end
		previous = i
	end

	increases
end

def part_two
	i = 0
	input = get_input
	nums = Array.new
	while i < input.count
		group = input[i, 3];
		sum = group.sum
		# Only include them if there are 3 numbers to add together
		if (group.count >= 3)
			nums.push(sum)
		end
		i += 1
	end
	nums
end

def day_one
	p1 = part_one(get_input)
	p2 = part_one(part_two)
	puts "Part 1: #{p1}"
	puts "Part 2: #{p2}"
end

day_one
