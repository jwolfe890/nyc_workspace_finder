require 'Nokogiri'
require 'open-uri' 
require 'pry'

class NycWorkspaceFinder::Floors

    def initialize(name = nil, url = nil)
      @name = name
      @url = url
    end 

    def self.scrape_42floors
      @names2 = []
      doc = Nokogiri::HTML(open("https://42floors.com/coworking/us/ny/new-york"))
      names = doc.search("div.name-container")
      names.collect.with_index(1) do |name, num|
         "#{num}. #{name.text.strip}"
      end 
    end

    def self.numbers
      scrape_42floors.collect {|x| x.match(/\d+/)[0].to_i}
    end 

    def self.url 
      doc2 = Nokogiri::HTML(open("https://42floors.com/coworking/us/ny/new-york"))
      numbers.collect {|num| puts "https://42floors.com#{doc2.search('div.title a')[num-1]['href']}"}
    end 

    end

    # def all
    #   scrape_42floors.each.with_index(1) do |space, i|
    #   puts "#{i}. #{space}"
    # end
    # end

    # def doc
    #   @doc ||= Nokogiri::HTML(open(self.url))
    # end  




# hello.each {|x| puts x.match(/\d+/)}

# .match(/MONTHLY(.*)5./).to_s
# Floors.scrape_42floors
# Floors.numbers 
# Floors.url 
# doc.search("div.title a")[1]["href"]
# THIS!

