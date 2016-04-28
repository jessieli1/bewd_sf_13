pets = ["cat", "dog", "bird", "cat"]
fruits = ["apple", "pear", "orange"]
colors = %w{red orange yellow}
color = "green"
fruit = "watermelon"
fruit2 = "apple"


# .size returns the number of elements in the array
puts "#{colors} has #{colors.size} elements"

# .push or << adds elements to an array
# << will add an array inside of an array, push will join the arrays
puts ".push adds #{color} to #{colors}: #{colors.push(color)}"
puts "<< adds #{fruits} to #{pets}: #{pets<<fruits}"

# .pop removes and returns the last element of an array
puts ".pop removes and returns the last element of #{colors}: #{colors.pop}"

# .unshift prepends elements to the front of an array
puts ".unshift adds #{fruit} to the beginning of #{fruits}: #{fruits.unshift(fruit)}"

# .shift removes/returns the first element of an array, or removes/returns elements up to an index
puts ".shift removes and returns the first element of #{fruits}: #{fruits.shift}"
puts ".shift can also remove the first 2 elements: #{fruits}: #{fruits.shift(2)}"

# .uniq returns an array without duplicates and .uniq! removes duplicates from an array
puts ".uniq returns #{pets} without duplicates: #{pets.uniq}"
puts ".uniq! removes duplicates from #{pets}: #{pets.uniq!}"

# .include? returns true if an element is in an array
puts "it is #{fruits.include?(fruit)} that #{fruit} is in #{fruits}"
puts "it is #{fruits.include?(fruit2)} that #{fruit2} is in #{fruits}"
