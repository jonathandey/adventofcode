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

def sum_position (coords)
	coords[0].to_i * coords[1].to_i
end

def get_aim(input)
	aim = 0
	coords = [0, 0]
	
	for action in input do
		# split the action in to two parts. E.g "forward 5" becomes ["forward", "5"]
		command = action.split(" ")

		# Use the first letter of the first part of the command e.g. forward becomes f
		case command[0][0]
		when "f"
			coords[0] += command[1].to_i
			coords[1] += command[1].to_i * aim
		when "d"
			aim += command[1].to_i
		when "u"
			aim -= command[1].to_i
		end
	end

	sum_position(coords)
end

def get_position (input)
	coords = [0, 0]
	
	for action in input do
		# split the action in to two parts. E.g "forward 5" becomes ["forward", "5"]
		command = action.split(" ")

		# Use the first letter of the first part of the command e.g. forward becomes f
		case command[0][0]
		when "f"
			coords[0] += command[1].to_i
		when "d"
			coords[1] += command[1].to_i
		when "u"
			coords[1] -= command[1].to_i
		end
	end

	sum_position(coords)
end

def day_two
	position = get_position(get_input)
	aim = get_aim(get_input)

	puts "Position: #{position}"
	puts "Aim: #{aim}"
end

day_two
