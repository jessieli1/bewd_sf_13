require 'pry'
require 'pry-byebug'

def get_love_interest
  puts "Give me a love interest (full name, please!): \n"
  love_interest = gets.chomp
  get_response(love_interest)
end

def get_response(love_interest)
  puts "Is #{love_interest} taken? (y/n) \n"
  response = gets.chomp.downcase
  give_advice(response, love_interest)
end

def give_advice(response, love_interest)
  case response
  when "y"
    puts "I don't think you want to pursue #{love_interest}"
  when "n"
    puts "Go for it! #{love_interest} might love you back!"
  else
    puts "Sorry, please input 'y' or 'n'"
    get_response(love_interest)
  end
end

get_love_interest
