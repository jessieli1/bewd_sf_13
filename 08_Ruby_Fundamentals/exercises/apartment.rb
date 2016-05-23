require 'pry'
require 'pry-byebug'

#create an apartment class using OOP principles
class Apartment
  attr_accessor :title, :url, :price, :location

  def initialize(title, url, price, location)
    @title = title
    @url = url
    @price = price
    @location = location
  end
end
