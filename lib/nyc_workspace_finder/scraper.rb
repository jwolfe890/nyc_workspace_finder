require 'pry'
require 'open-uri'
require 'nokogiri'
require 'pry'

class NycWorkspaceFinder::Scraper 

attr_accessor :computer_station, :open_desk, :nights_weekends,
:dedicated_desk, :rates, :ft_desks, :pvt_offce, :pt_workspace, 
:virtual, :limited, :monthly
 
    def scrape_productive
      doc = Nokogiri::HTML(open("http://theproductivenyc.com/prices/"))
      self.open_desk = doc.search("tr td").first.text[1..-1].split.join(' ')
      self.computer_station = doc.search("tr td")[1].text[1..-1].split.join(' ')
      self.nights_weekends = doc.search("tr td")[2].text.split.join(' ')
      self.dedicated_desk = doc.search("tr td")[3].text[1..-1].split.join(' ')
    end 

    def scrape_nospace
      doc = Nokogiri::HTML(open("http://notanalternative.org/2011/05/17/coworking-no%E2%86%94space-featured-in-ny-post/"))
      self.rates = doc.search("div p")[1].text
    end 

    def scrape_brooklyncreativeleague
      doc = Nokogiri::HTML(open("http://brooklyncreativeleague.com/workspace/"))
      self.pvt_offce = "Private Offices: #{doc.search("section p")[1].text.gsub(" Details »", "")}"
      self.ft_desks = "Full-time desks: #{doc.search("section p")[2].text.gsub(" Details »", "")}"
      self.pt_workspace = "Part-time Workspace: #{doc.search("section p")[3].text.gsub(" Details »", "")}"
      self.virtual = "Virtual Office: #{doc.search("section p")[4].text.gsub(" Details »", "")}"
    end

    def scrape_conartist_nyc
      doc = Nokogiri::HTML(open("http://conartistnyc.com/blogs/news/10543057-need-workspace"))
      self.limited = doc.search("div.post-content p").text.match(/LIMITED(.*)9\sa\sweek./).to_s
      self.monthly = doc.search("div.post-content p").text.match(/MONTHLY(.*)5./).to_s
    end 
end


