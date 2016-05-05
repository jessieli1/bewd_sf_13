#1 - Create 5 or more hashes with cars - include 5 keys
  #- brand, model, year, price, is_electric
#2 - Create an array of hashes
#3 - Iterate through the array using the `.each` method
#4 - Practice using `if` && `unless` conditionals (print a special message when cars are good for the enviornment)
#5 - BONUS create an `:add_cars` method that takes an unlimited number of cars and transforms them into an array

# 1. Establish inventory - need array with hashes with info about each car
# 2. Car buyer preferences via user input
# 3. Basic matching engine -> series of methods -> electric? price ceiling? color? brand?
# 4. Print cars that may suit buyer

require 'pry'

def show_all_cars(cars)
  cars.each do |car|
    puts "The #{car[:year]} #{car[:brand]} #{car[:model]} costs #{car[:price]}."
    if car[:is_electric]
      puts "It's electric!"
    end
    unless car[:is_electric] == false
      puts "So it's good for the environment!"
    end
  end
end

def get_budget
  puts "What is your max budget? \n"
  budget = gets.chomp.to_i
  return budget
end

def find_in_budget(cars, budget)
  cars_in_budget = []
  cars.each do |car|
    if car[:price] <= budget
      cars_in_budget << car
    end
  end
  return cars_in_budget
end

def show_cars_in_budget(cars_in_budget)
  if cars_in_budget.length == 0
    puts "Sorry, we don't have any cars within your budget."
  else
    puts "Here are some options for you:"
    show_all_cars(cars_in_budget)
  end
end

def add_cars(*cars_list)
  cars_list
end

########

tesla = { brand: "Tesla", year: 2000, model: "Model X", price: 80000, is_electric: true }
toyota = { brand: "Toyota", year: 2012, model: "Camry", price: 25000, is_electric: false }
ford = { brand: "Ford", year: 2005, model: "Fusion", price: 20000, is_electric: false }
bmw = { brand: "BMW", year: 2016, model: "3 Series", price: 30000, is_electric: false }
hyundai = { brand: "Hyundai", year: 2012, model: "Elantra", price: 20000, is_electric: false }

cars = []
cars = add_cars(tesla, toyota, ford, bmw, hyundai)

cars_in_budget = find_in_budget(cars, get_budget)
show_cars_in_budget(cars_in_budget)
