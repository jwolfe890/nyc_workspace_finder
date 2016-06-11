require 'pry'
require 'open-uri'
require 'nokogiri'
require 'pry'

class NycWorkspaceFinder::Floorcli2 

  def call
    start
  end

  def list
    puts "-------------------------------------------------------------------------------"
    puts "WELCOME TO NYC WORKSPACE FINDER.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "-------------------------------------------------------------------------------"
    NycWorkspaceFinder::Floors2.all.each.with_index(1) do |space, i|
        puts "#{i}. #{space.name}" 
    end 
  end

  def print_space(number)
    space = NycWorkspaceFinder::Floors2.find_by_input(number.to_i)
    puts ""
    puts space.name
    puts ""
    puts space.address
    puts ""
    puts space.description
    puts ""
  end

  def start
    list 
    input = nil 
    while input != "exit"
    puts "Please pick a space between 1-#{NycWorkspaceFinder::Floors2.all.length}."
    input = gets.strip
      if input.to_i > 0 && input.to_i < NycWorkspaceFinder::Floors2.all.length+1
        print_space(input)
      end   
    end
  end
   
end 