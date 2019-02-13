scales = [
	"blah",
"chromatic",
"major scale",
"minor scale",
"major triad",
"minor triad",
"root+5th",
"major triad+6th",
"minor triad+6th",
"major triad+7th",
"minor triad+7th",
"root+5th+6th",
"root+5th+7th",
"pentatonic major",
"pentatonic minor",
"natural minor scale",
"harmonic minor scale"
]

scales.each_with_index { |s,index|
  puts "<tr><td>#{index}</td><td>#{s}</td></tr>"
}

red = [
["Type I", "Type I"],
["Type II", "Type II"],
["Type I", "Type II"],
["Type II", "Type I"],
["Type I", "None"],
["Type II", "None"],
["None", "Type I"],
["None", "Type I"],

]

red.each_with_index { |s,index|
  puts "<tr><td>#{index}</td><td>#{s[0]}</td><td>#{s[1]}</td></tr>"
}

man = [
"None",
"Bit swap 1",
"Bit swap 1",
"Bit swap 1",
"Bit rotation",
"Previous sample XOR 1",
"Previous sample XOR 2",
"Previous sample XOR 3",
]

man.each_with_index { |s,index|
  puts "<tr><td>#{index}</td><td>#{s}</td></tr>"
}

notes = [
"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"
]

(-12..12).to_a.each_with_index do |i, v|
  puts "<tr><td>#{i}</td><td>#{notes[v % notes.length]}</td></tr>"
end

divs=[
"1/64",
"1/48",
"1/32",
"1/24",
"1/16",
"1/12",
"1/8",
"1/6",
"3/16",
"1/4",
"5/16",
"1/3",
"3/8",
"1/2",
"3/4",
"x1",
"x1.5",
"x2",
"x3",
"x4",
"x5",
"x6",
"x8",
"x16"
]

divs.each_with_index { |s,index|
  puts "<tr><td>#{index-15}</td><td>#{s}</td></tr>"
}
