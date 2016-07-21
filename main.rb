# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

# binding.pry

def display_menu
  puts "What do you want to do?"
  puts "Select from 1 to 4"
  puts '1 - Find the candidate id'
  puts '2 - Display all candidates'
  puts '3 - Display all qualified candidates - ordered by experience and points'
  puts '4 - Display initial list of qualified candidates'
  puts 'Or just type "Exit" to get outta here!'
end

def repl
  loop do
    display_menu
    reply = gets.chomp.downcase
    break if reply == "exit"
    case reply
    when '1'
      puts "Type the ID you want to find"
      id = gets.chomp.downcase.to_i
      pp find(id)
    when '2'
      print_all
    when '3'
      pp display_qualified
    when '4'
      pp qualified_candidates
    else
      puts 'Invalid Input. Try Again. Select from 1 to 4'  
    end
  end
end

repl



