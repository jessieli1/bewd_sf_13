require 'pry'
require 'pry-byebug'
require_relative 'robot'

class Android < Robot
  attr_accessor :name, :origin, :type

  def initialize(name, origin, type='android')
    super
  end

  def writing_skills
    puts "I'm smart enough to write"
  end

  def dancing_skills
    puts "Check out my dance moves!" if origin == 'SF'
  end

end

android = Android.new('Jessie', 'SF')
android.writing_skills
android.dancing_skills
