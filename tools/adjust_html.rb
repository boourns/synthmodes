require "nokogiri"
require 'byebug'

Dir["./*.html"].each do |filename|
  html = File.open(filename) { |f| Nokogiri::HTML(f) }
  
  html.xpath("//html//body//table").each_with_index do |table, index|
  	  table["class"] = "parameters"
  end

  File.write(filename, html.inner_html)
end
