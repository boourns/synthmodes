require "nokogiri"
require 'byebug'

Dir["./*.html"].each do |filename|
  html = File.open(filename) { |f| Nokogiri::HTML(f) }
  
  html.xpath("//html//body//table").each_with_index do |table, index|
  	if index == 0
  	  table["class"] = "parameters bordered"
  	else
  	  table["class"] = "bordered"
  	end
  end

  File.write(filename, html.inner_html)
end
