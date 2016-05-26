require 'pry'
require 'pry-byebug'

class Apartment

  # creates read & write methods for each attribute
  attr_accessor :title, :url, :price, :location

  # instance variables
  def initialize(title, url, price, location)
    @title = title
    @url = url
    @price = price
    @location = location
  end
end
