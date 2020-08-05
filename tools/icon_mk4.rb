letters = %w(a b c d e f g h i j k l m n)
#letters = %w(n)
numbers = (1..8).to_a

letters.each do |l|
	numbers.each do |n|
		filename = "#{l}#{n}.png"
		text = "#{l.upcase}#{n}"
        cmd = "convert -background transparent -fill \"#a7a7a7\"  -font 5by7.regular.ttf -size 90x80 -pointsize 70 -gravity center label:#{text} ../data/disting_mk4/img/#{filename}"
        `#{cmd}`
  end
end
