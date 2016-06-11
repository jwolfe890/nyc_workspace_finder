require 'Nokogiri'
require 'open-uri' 
require 'pry'

class NycWorkspaceFinder::Floors2

attr_accessor :page, :input, :url

ALLSPACES = []

    def initialize(name, page, input)
      @name = name
      @page = page
      @input = input
      ALLSPACES << self
    end 

    def self.scrape_42floors2
      names2 = []
      doc = Nokogiri::HTML(open("https://42floors.com/coworking/us/ny/new-york"))
      names = doc.search("div.name-container")
      names.each do |name|
        names2 << name.text.strip
      end
      names3 = names2.uniq
      names3.collect.with_index{|e, num| new(e, "https://42floors.com#{doc.search('div.title a')[num]['href']}", num+1)}.uniq
    end
 
    def self.all
      @@all ||= scrape_42floors2
    end 

    def self.find_by_input(input) 
      ALLSPACES.detect{|a| a.input == input}
    end

    def doc2
      @doc2 ||= Nokogiri::HTML(open(self.page))
    end

    def name
      @name ||= doc2.search("h1.name").text.strip 
    end

    def address
      @address ||= doc2.search("div.address:nth-of-type(1)").text.strip.gsub(/[^0-9a-zA-Z, ]/, " ").gsub(/^ +/, "")
    end 

    def description
      @description ||= doc2.search("div p").text.gsub(/\bCopyright.*/, "").gsub("  ","").strip
    end  

end