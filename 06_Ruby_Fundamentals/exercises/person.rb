#Classes have state and behavior
#State & Object Factory: factory that creates and instiantes robots
#Behavior: Collection of class methods, instance methods, instance variable, local variables, constants etc.,

require 'pry'
require 'pry-byebug'

class Person

  #creates getter && setter methods for each attribute
  attr_accessor :name, :age, :home_town

  #instance_factory to support creating a new person using Person.new
  # instance variables are available everywhere in the class
  def initialize(name, age, home_town)
    @name = name
    @age = age
    @home_town = home_town
  end

  def to_s
    puts "My name is #{@name}. I'm #{@age} and from #{@home_town}"
  end

  def coding_skills
    if home_town == "SF"
      puts "I have coding skills"
    else
      puts "I can't code :("
    end
  end

end


person = Person.new("Jessie", 24, "SF")
person2 = Person.new("Harry Potter", 17, "London")

person.coding_skills
person2.coding_skills
