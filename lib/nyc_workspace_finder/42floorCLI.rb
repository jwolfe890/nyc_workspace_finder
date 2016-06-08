require 'pry'
require 'open-uri'
require 'nokogiri'
require 'pry'

class NycWorkspaceFinder::Floorcli 

  # def call
  #   start
  # end

  def list
    NycWorkspaceFinder::Floors.scrape_42floors
  end

end 

NycWorkspaceFinder::Floorcli.new.list 

#   def print_movie(movie)
#     puts ""
#     puts "-------------- #{movie.name} --------------"

#     puts ""
#     puts movie.summary
#     puts ""

#     puts "Starring: #{movie.stars}"
#     puts ""
#   end

#   def start
#     list
#     input = nil
#     while input != "exit"
#       puts ""
#       puts "What movie would you more information on, by name or number?"
#       puts ""
#       puts "Enter list to see the movies again."
#       puts "Enter exit to end the program."
#       puts ""
#       input = gets.strip
#       if input == "list"
#         list
#       elsif input.to_i == 0
#         if movie = NowPlaying::Movie.find_by_name(input)
#           print_movie(movie)
#         end
#       elsif input.to_i > 0
#         if movie = NowPlaying::Movie.find(input.to_i)
#           print_movie(movie)
#         end
#       end
#     end
#     puts "Goodbye!!!"
#   end
# end