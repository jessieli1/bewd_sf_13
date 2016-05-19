require 'pry'
require 'pry-byebug'

class Robot
  # attr_accessor only takes in symbols
  attr_accessor :name, :origin, :type

  def initialize(name, origin, type='beta')
    @name = name
    @type = type
    @origin = origin
  end

  # instance method
  def to_s
  end

  def flying_skills
    puts "I am #{@name}. I have flying skills"
  end

end

robot = Robot.new('Jessie', 'android', 'SF')
robot.flying_skills
