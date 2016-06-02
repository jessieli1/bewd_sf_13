require 'pry'
require 'pry-byebug'

class Job
  attr_accessor :name, :url, :location, :address, :type, :comp

  def initialize(name, url, location, address, type, comp)
    @name = name
    @url = url
    @location = location
    @address = address
    @type = type
    @comp = comp
  end
end
