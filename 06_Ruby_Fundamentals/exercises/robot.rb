#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

require 'pry'
require 'pry-byebug'

class Robot

  #creates getter && setter methods for each attribute
  attr_accessor :name, :type, :origin

 #instance_factory to support creating a new robot using Robot.new
  def initialize(name, type, origin)
    @name = name
    @type = type
    @origin = origin
  end

  def to_s
    puts "My name is #{@name}. I'm a #{@type} droid and from the planet #{@origin}"
  end

  #class methods can be called outside of the class like Robot.make_robots(number)
  def self.make_robots(number)
    i = 0
    until i == number
      Robot.random_robot_maker
      i += 1
    end
  end

  def self.random_robot_maker
    names = ['C3PO', 'R2D2', 'BB8', 'AZI3', '21B', 'FA4', 'IG88']
    types = ['battle', 'astromech', 'protocol', 'security', 'assassin', 'medical', 'maintenance']
    origins = ['Coruscant', 'Tatooine', 'Felucia', 'Hoth', 'Naboo', 'Serenno']

    name = names.sample
    type = types.sample
    origin = origins.sample

    puts "Building #{type} droid, named #{name}, from #{origin}"
    return Robot.new(name, type, origin)
  end

  #instance methods can only be called by instances of a class
  def empathy
    if @type == 'protocol'
      puts "Hi there, my name is #{@name}. I'm a #{@type} droid, one of the most advanced intellectual droids ever invented."
    else
      puts "My name is #{@name}. I'm a #{@type} droid and not programmed to interact intellectually with humans."
    end
  end

  #this is an instance method
  def intellectual_skills
    if ['astromech', 'protocol', 'medical'].include? @type
      add_intellect
    else
      puts "I'm a #{@type} droid. My primary purpose is not intellectual."
    end
  end

  def battle_skills
    if ['battle', 'security', 'assassin'].include? @type
      add_battle_skills
    else
      puts "I'm a #{@type} droid and unfortunately have no battle skills."
    end
  end

  private

  def add_intellect
    if @type == 'astromech'
      puts "I'm a #{@type} droid with extensive knowledge of stellar systems and hyperspatial coordinates."
    elsif @type == 'medical'
      puts "I'm a #{@type} droid with extensive knowledge of the medical practice."
    else
      puts "I'm a #{@type} droid with extensive knowledge of various languages and cultures."
    end
  end

  def add_battle_skills
    if @type == 'security'
      puts "I'm a #{@type} droid. My battle skills are good."
    elsif @type == 'battle'
      puts "I'm a #{@type} droid. My battle skills are great!"
    else
      puts "I'm a #{@type} droid. You don't want to mess with me.."
    end
  end
end

# ====================

Robot.make_robots(5)
droid = Robot.random_robot_maker
droid.empathy
droid.intellectual_skills
droid.battle_skills
