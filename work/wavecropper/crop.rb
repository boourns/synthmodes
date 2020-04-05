def process_wave1
	lines = 13
	yOffset = 8
	xOffset = 17
	height = 114
	size = "1254x#{height}"
	input = "wave1.png"
	lineOffset = 1

	(0...lines).each do |l|
		if l == 7
			yOffset += 2
		end
		if l == 10
			yOffset += 2
		end
		if l == 12
			yOffset += 1
		end
		y = yOffset + (l*height)
		filename = "wave1/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave2
	input = "wave2.png"
	lines = 3
	yOffset = 4
	xOffset = 24

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		y = yOffset + (l*height)
		filename = "wave2/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave3
	input = "wave3.png"
	lines = 16
	yOffset = 9
	xOffset = 10

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		y = yOffset + (l*height)
		filename = "wave3/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave4
	input = "wave4.png"
	lines = 16
	yOffset = 6
	xOffset = 10

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		y = yOffset + (l*height)
		filename = "wave4/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave5
	input = "wave5.png"
	lines = 16
	yOffset = 26
	xOffset = 22

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		y = yOffset + (l*height)
		filename = "wave5/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave6
	input = "wave6.png"
	lines = 16
	yOffset = 12
	xOffset = 13

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		y = yOffset + (l*height)
		filename = "wave6/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave7
	input = "wave7.png"
	lines = 16
	yOffset = 5
	xOffset = 14

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		if l == 3
			yOffset -= 2
		end
		if l == 13
			yOffset -= 2
		end
		y = yOffset + (l*height)
		filename = "wave7/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave8
	input = "wave8.png"
	lines = 16
	yOffset = 4
	xOffset = 10

	height = 102
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		if l == 10
			yOffset -= 2
		end
		y = yOffset + (l*height)
		filename = "wave8/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end

def process_wave9
	input = "wave9.png"
	lines = 16
	yOffset = 9
	xOffset = 20

	height = 98
	size = "1254x#{height}"
	lineOffset = 1

	(0...lines).each do |l|
		if l == 3 || l == 8 || l == 13
			yOffset -= 2
		end
		y = yOffset + (l*height)
		filename = "wave9/line#{lineOffset+l}.png"

		`convert -crop #{size}+#{xOffset}+#{y} #{input} #{filename}`
	end
end


process_wave9