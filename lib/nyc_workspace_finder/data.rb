class NycWorkspaceFinder::Data 

 def self.productive_data 
      something = NycWorkspaceFinder::Scraper.new 
      something.scrape_productive
      puts ""
      puts "RATES:"
      puts "-#{something.open_desk}"
      puts "-#{something.computer_station}"
      puts "-#{something.nights_weekends}"
      puts ""
      puts "ADDED INFO: dedicated to providing an energetic working environment for entrepreneurs and creative professionals; developers, animators,"
      puts "digital artists, designers, writers and editors are all welcome."
      puts ""
      puts "ADDRESS: 40 W. 38th St. 5th floor"
      puts "WEBSITE: http://theproductivenyc.com"
      puts "CONTACT: info@theproductivenyc.com or call 917-668-8574"
    end

    def self.no_space_data
      something2 = NycWorkspaceFinder::Scraper.new 
      something2.scrape_nospace
      puts ""
      puts "#{something2.rates}"
      puts ""
      puts "ADDED INFO: current tenants are involved in video/film, art, journalism, marketing, graphic design, and non-profit advocacy work."
      puts ""
      puts "ADDRESS: 67 West St, #304, Greenpoint, Brooklyn, 11222."
      puts "WEBSITE: http://notanalternative.org/2011/05/17/coworking-no↔space-featured-in-ny-post/"
      puts "CONTACT: info@notanalternative.net"
    end

    def self.brooklyn_creative_league_data
      something3 = NycWorkspaceFinder::Scraper.new 
      something3.scrape_brooklyncreativeleague
      puts ""
      puts "RATES:"
      puts "-#{something3.ft_desks}"
      puts "-#{something3.pvt_offce}"
      puts "-#{something3.pt_workspace}"
      puts "-#{something3.virtual}"
      puts ""
      puts "ADDED INFO: gives freelance professionals, small-shop companies, and nonprofits the tools they need to get their work done: affordable, green shared workspace, office amenities,"
      puts "and a community of professional colleagues."
      puts ""
      puts "ADDRESS: 540 President St, Brooklyn NY 11215"
      puts "WEBSITE: http://brooklyncreativeleague.com"
      puts "CONTACT: (718) 576-2104"
    end

    def self.con_artist_data
      something4 = NycWorkspaceFinder::Scraper.new 
      something4.scrape_conartist_nyc
      puts ""
      puts "RATES:"
      puts "-#{something4.limited}"
      puts "-#{something4.monthly}"
      puts ""
      puts "ADDED INFO: Con Artist is an art collective, community, workspace & gallery. Our venue hosts events, publications, collaboration, products, and essentially shapes the ideal circumstances for creative people and their creative pursuits. The most common reason members join the collective is for 24/7 access to our shared workspace. The two floors have all the tools necessaryto pull off most any kind of project. Our members have built nearly everything at our 119 Ludlow location, so the space is fine-tuned to perpetuate the spirit of creativity and growth."
      puts ""
      puts "ADDRESS: 119 Ludlow St, New York, NY 10002"
      puts "WEBSITE: http://conartistnyc.com"
      puts "CONTACT: (646) 504-2323"
    end 

end 