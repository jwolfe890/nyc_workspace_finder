class NycWorkspaceFinder::CLI 

    def call
      puts "Welcome to NYC Workspace Finder. We provide up-to-date pricing info on unique, art-oriented, or straight-punk workspaces throughout New York City. You won't find WeWork here!"
      puts ""
      start 
      manhattan_or_brooklyn 
    end

    def start
      puts "Are you looking for a workspace in Manhattan or Brooklyn?"
      @input = gets.strip.downcase
      @input 
    end 

    def manhattan_or_brooklyn  
      if @input == "manhattan" || @input2 == "manhattan"
          puts "Please choose a workspace by number to find out more about its pricing options."
          puts "1. The Productive"
          @workspace = gets.strip 
          manhattan_workspace_data
          again    
      elsif @input == "brooklyn" || @input2 == "brooklyn"
          puts "Please choose a workspace by number to find out more about its pricing options."
          puts "1. No Space"
          @workspace = gets.strip
          brooklyn_workspace_data
          again
      end
    end

    def manhattan_workspace_data
      if @workspace == "1"
          productive_data
      end 
    end 

    def brooklyn_workspace_data
      if @workspace == "1"
          no_space_data
      end
    end 

    def no_space_data
      something2 = NycWorkspaceFinder::Scraper.new 
      something2.scrape_nospace
      puts ""
      puts "#{something2.rates}"
    end

    def productive_data 
      something = NycWorkspaceFinder::Scraper.new 
      something.scrape_productive
      puts ""
      puts "#{something.open_desk}"
      puts "#{something.computer_station}"
      puts "#{something.nights_weekends}"
      puts ""
      puts "Address: 40 W. #38th St. 5th floor"
      puts "Contact: info@theproductivenyc.com or call 917-668-8574"
    end

    def again
      puts ""
      puts "Would you like to see more workspaces?"
      input = gets.strip.downcase
        if input == "yes"
          puts "Manhattan or Brooklyn?"
          @input2 = gets.strip
          manhattan_or_brooklyn
        else 
          puts ""
          puts "Bye! Remember to check back later for updated workspace options!" 
        end 
    end 

end

