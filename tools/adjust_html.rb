require "nokogiri"
require 'byebug'

Dir["./*.html"].each do |filename|
  html = File.open(filename) { |f| Nokogiri::HTML(f) }
  
  # add class to tables
  # html.xpath("//html//body//table").each_with_index do |table, index|
  # 	  table["class"] = "parameters"
  # end

  # remove custom styles
  html.xpath('//@style').remove

  File.write(filename, html.inner_html)
end
