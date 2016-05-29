class NycWorkspaceFinder::CLI 
    def call
      puts "-------------------------------------------------------------------------------------------------------------------------------"
      puts "WELCOME TO NYC WORKSPACE FINDER. PROVIDING UP-TO-DATE PRICING INFO ON UNIQUE, ART OR PUNK-ORIENTED WORKSPACES IN NEW YORK CITY!"
      puts "-------------------------------------------------------------------------------------------------------------------------------"
      puts ""
      start 
      manhattan_or_brooklyn 
    end

    def start
      puts "Are you looking for a workspace in Manhattan or Brooklyn?"
      @input = gets.strip.downcase
    end 

    def manhattan_or_brooklyn  
      if @input == "manhattan" 
          puts "-------------------------------------------------------------------------------------"
          puts "Please choose a workspace by number below to find out more about its pricing options."
          puts "-------------------------------------------------------------------------------------"
          puts ""
          puts "1. THE PRODUCTIVE -- 38th St."
          puts "2. CON ARTIST -- Lower East Side"
          @workspace = gets.strip 
          manhattan_workspace_data
          again    
      elsif @input == "brooklyn" 
          puts "-------------------------------------------------------------------------------------"
          puts "Please choose a workspace by number below to find out more about its pricing options."
          puts "-------------------------------------------------------------------------------------"
          puts ""
          puts "1. NO SPACE -- Greenpoint"
          puts "2. BROOKLYN CREATIVE LOUNGE -- Gowanus"
          @workspace = gets.strip
          brooklyn_workspace_data
          again
      end
    end

    def manhattan_workspace_data
      if @workspace == "1"
          productive_data
      elsif @workspace == "2"
          con_artist_data
      end 
    end 

    def brooklyn_workspace_data
      if @workspace == "1"
          no_space_data
      elsif @workspace == "2"
          brooklyn_creative_league_data
      end
    end 

    def productive_data 
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

    def no_space_data
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

    def brooklyn_creative_league_data
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

    def con_artist_data
      something4 = NycWorkspaceFinder::Scraper.new 
      something4.scrape_conartist_nyc
      puts ""
      puts "RATES:"
      puts "#{something4.limited}"
      puts "#{something4.monthly}"
      puts ""
      puts "ADDED INFO: Con Artist is an art collective, community, workspace & gallery. Our venue hosts events, publications, collaboration, products, and essentially shapes the ideal circumstances for creative people and their creative pursuits. The most common reason members join the collective is for 24/7 access to our shared workspace. The two floors have all the tools necessaryto pull off most any kind of project. Our members have built nearly everything at our 119 Ludlow location, so the space is fine-tuned to perpetuate the spirit of creativity and growth."
      puts ""
      puts "ADDRESS: 119 Ludlow St, New York, NY 10002"
      puts "WEBSITE: http://conartistnyc.com"
      puts "CONTACT: (646) 504-2323"
    end 

    def again
      puts ""
      puts "--------------------------------------"
      puts "Would you like to see more workspaces?"
      input = gets.strip.downcase
        if input == "yes"
          puts "----------------------"
          puts "Manhattan or Brooklyn?"
          puts "----------------------"
            @input = gets.strip
            manhattan_or_brooklyn
        else 
          puts ""
          puts "Check back later for new workspace options!" 
        end 
    end 

end

