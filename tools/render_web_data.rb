require 'byebug'
require 'nokogiri'
require 'fileutils'

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    tr(" ", "_").
    gsub(/\/*\\*\(*\)*/, "").
    gsub("&", "").
    gsub("__", "_").
    downcase
  end
end

class Section
  def initialize(xml, directory)
    @name = xml.attributes["name"].value
    @modeList = (xml.attributes["modelist"].value == "true")
    @directory = directory
    @pages = xml.xpath("page").map do |xml|
      content = xml.attributes["content"].value
      {
        name: xml.attributes["name"].value,
        content: content,
        anchor: File.basename(content).gsub(".html", "")
      }
    end
  end
  
  def content_for_index
    "<b>#{@name}</b><br />" + @pages.map { |page| "<a href=\"##{page[:anchor]}\">#{page[:name]}</a><br />" }.join("\n")
  end

  def content_for_web
    content = "<h2>#{@name}</h2>"
    @pages.each do |page|
      page_html="<a name=\"#{page[:anchor]}\"></a><h2>#{page[:name]}</h2>"
      html = File.open("#{@directory}/#{page[:content]}") { |f| Nokogiri::HTML(f) }
      page_html += html.xpath("//html//body").inner_html

      content += page_html + "<br /><br />"
    end
    content
  end
end

class ModuleEntry
  attr_reader :name
  attr_reader :id
  attr_reader :index
  attr_reader :sections
  attr_reader :directory
  attr_reader :manufacturer

  def initialize(xml, manufacturer)
    @name = xml.attributes["name"].value
    @id = xml.attributes["id"].value
    @index = xml.attributes["index"].value
    @manufacturer = manufacturer

    filename = "data/#{@index}"
    @directory = File.dirname(filename)

    doc = File.open(filename) { |f| Nokogiri::XML(f) }
    @sections = []
    doc.xpath("//module//sections//section").each do |xml|
      @sections << Section.new(xml, @directory)
    end
  end

  def content_for_web
    content = "---
layout: page
title: #{@name}
manufacturer: #{@manufacturer}
---
" + css + @sections.map { |s| s.content_for_index }.join("\n") + @sections.map { |s| s.content_for_web }.join("\n")
  end

  def css
    css_files = Dir["#{@directory}/*.css"] + Dir["data/common.css"]
    "<style>" + css_files.map { |f| File.read(f) }.join("\n") + "</style>"
  end

  def images_dir
    "#{@directory}/img"
  end
end

class Manufacturer
  attr_reader :name
  attr_reader :modules

  def initialize(xml)
    @name = xml.attributes["name"].value

    @modules = []
    xml.xpath("module").each do |xml|
      @modules << ModuleEntry.new(xml, @name)
    end
  end
end

doc = File.open("data/modules.xml") { |f| Nokogiri::XML(f) }

manufacturers = []
modules = []

doc.xpath("//modules//manufacturer").each do |xml|
  m = Manufacturer.new(xml)
  manufacturers << m
  modules += m.modules
end

modules.each do |m|
  dir = "web/modules/#{File.dirname(m.index)}"
  begin
    FileUtils.mkdir(dir)
  rescue Errno::EEXIST
  end
  if File.exist?(m.images_dir)
    `cp -R #{m.images_dir} #{dir}`
  end
  File.write("#{dir}/index.html", m.content_for_web)

end
