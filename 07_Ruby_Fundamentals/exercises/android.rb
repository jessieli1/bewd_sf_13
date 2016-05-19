require 'pry'
require 'pry-byebug'
require_relative 'robot'

class Protocol < Robot
  #creates getter && setter methods for each attribute
  attr_accessor :name, :origin, :type

  #instance_factory to support creating a new person using Person.new
  def initialize(name, origin, type="protocol")
    super
  end

  def self.random_robot_maker
    names = ['C3PO', 'A3PO', 'B3P0', 'D3P0', 'E3P0']
    origins = ['Coruscant', 'Tatooine', 'Felucia', 'Hoth', 'Naboo', 'Serenno']

    name = names.sample
    origin = origins.sample

    droid = Protocol.new(name, origin)
    puts "Building #{:type} droid, named #{name}, from #{origin}"
    return droid
  end

  def intellectual_skills
    learn_languages
    learn_etiquette
  end

  def translate_english_to_robot(english)
    puts english.reverse.gsub('e','eeee').gsub('b','beeboo')
  end

  def hold_weapon
    puts "Oh no no! Don't give me that weapon!"
  end

  private

  def learn_languages
    puts "I can speak and understand hundreds of languages."
  end

  def learn_etiquette
    puts "I'm educated in the cultures of the many planets of the galaxy."
  end
end

# ====================

protocol = Protocol.random_robot_maker
protocol.etiquette
protocol.translate_english_to_robot("hello")
protocol.translate_english_to_robot("bye")
protocol.hold_weapon
