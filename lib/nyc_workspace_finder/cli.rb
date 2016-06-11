require 'pry'
require 'open-uri'
require 'nokogiri'
require 'pry'


# doc.search("div#tps_slideContainer_12331").text
# name




class NycWorkspaceFinder::CLI 
    def call
      doc = Nokogiri::HTML(open("https://42floors.com/coworking/us/ny/new-york"))

      binding.pry 
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
          NycWorkspaceFinder::Data.productive_data
      elsif @workspace == "2"
          NycWorkspaceFinder::Data.con_artist_data
      end 
    end 

    def brooklyn_workspace_data
      if @workspace == "1"
          NycWorkspaceFinder::Data.no_space_data
      elsif @workspace == "2"
          NycWorkspaceFinder::Data.brooklyn_creative_league_data
      end
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

