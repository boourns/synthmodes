require 'nokogiri'
require 'byebug'

$html_prelude = %{
<html class="no-js">
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="description" content="">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
    <meta http-equiv="cleartype" content="on">
    <link rel="stylesheet" href="disting.css" />
  </head>
  <body>
}

$html_finale = %{
        </body>
</html>
}

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

class ElementBase
  def in_table?
    false
  end
end

class DistingControl < ElementBase
  def initialize(xml)
    @name = xml.attributes["name"].value
    @text = xml.children.first.text
  end

  def in_table?
    true
  end

  def render
    text = @text.gsub("\n", "<br />")

    "<tr><td><div class=\"control\">#{@name}</div></td><td>#{text}</td></tr>"
  end
end

class DistingParameter < ElementBase
  def initialize(xml)
    @parameters = {}
    xml.attributes.keys.each do |attr|
      @parameters[attr] = xml.attributes[attr].value
    end
    @description = xml.children.first.text
  end

  def render
    "#{@parameters} - #{@description}"
    par = @parameters.keys.map { |p| "<td class=\"parameter\">#{@parameters[p]}</td>" }.join("")
    
    des = @description.gsub("\n", "<br />")
    %{
      <table>
        <tr><th width="25%">pos</th><th width="25%">min</th><th width="25%">max</th><th width="25%">default</th></tr>
        <tr>#{par}</tr>
        <tr><td colspan=4>#{des}</td></tr>
      </table><br />
    }
  end
end

class Text < ElementBase
  def initialize(xml)
    @text = xml.children.first.text
  end

  def render
    @text
  end
end

class Section < ElementBase
  attr_reader :name
  attr_reader :children

  def initialize(xml)
    if !xml.attributes["title"].nil?
      @name = xml.attributes["title"].value
    end
    @children = xml.xpath("*").map do |el|
      klass = node_types[el.name]
      
      if klass.nil?
        raise "could not find generator for #{el.name}"
      else
        klass.new(el)
      end
    end
  end

  def render
    out = ""
    if !@name.nil?
      out += "<h3>#{@name}</h3>\n"
    end

    use_table = children.any? { |c| c.in_table? }
    if use_table
      out += "<table>"
    end
    out += children.map { |c| c.render }.join("\n")
    if use_table
      out += "</table>"
    end
    out
  end

  def node_types
    {
      "section" => Section,
      "text" => Text,
      "distingControl" => DistingControl,
      "distingParameter" => DistingParameter
    }
  end
end

class Algorithm
  attr_reader :name
  attr_reader :tags
  attr_reader :path
  attr_accessor :content

  def initialize(name, tags = [])
    @name = name
    @tags = tags
    @path = name.underscore
  end

  def render
    $html_prelude + @content.render + $html_finale
  end

  def render_index
    tags = ""
    if @tags.any?
      tags = "<tags>" + @tags.map { |t| "<tag>#{t}</tag>" }.join("\n") + "</tags>"
    end

    "<page name=#{@name.encode(:xml => :attr)} content=\"#{filename}\">#{tags}</page>"
  end

  def filename
    "#{path}.html"
  end
end

algorithms = []

doc = File.open("work/disting-old.xml") { |f| Nokogiri::XML(f) }

doc.xpath("//modules//module//algorithms//algorithm").each do |xml|
   name = xml.attributes["name"].value
   tags = xml.xpath("tags//tag").map { |t| t.children.first.text }

   algorithm = Algorithm.new(name, tags)
   algorithm.content = Section.new(xml.xpath("content").first)
   algorithms << algorithm
end

index = "<module><sections><section name=\"Algorithms\" modelist=\"true\">" + algorithms.map { |a| a.render_index }.join("\n") + "</section></sections></module>"

File.write("data/disting_mk4/module.xml", index)

algorithms.each do |alg|
  File.write("data/disting_mk4/#{alg.filename}", alg.render)
end
