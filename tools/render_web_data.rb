require 'byebug'
require 'json'

moduleList = JSON.parse(File.read('data/modules.json'))

moduleList["modules"].each_with_index do |m, index|
  moduleData = JSON.parse(File.read("data/#{m["index"]}"))
  moduleList["modules"][index]["sections"] = moduleData["sections"]
end

File.write("web/_data/modules.json", moduleList["modules"].to_json)