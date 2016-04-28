name = "jessie"
a = "My name is "
last_name = " li"
hello = "hello   "
a_string = "a string"

# length method returns number of characters
puts "#{name} has #{name.length} characters"

# prepend method adds a string to the beginning of a string
puts "The prepend method adds a string (#{a}) to the beginning of a string (#{name}): #{name.prepend(a)}"

# << method appends a string to the end of a string
puts "The << method adds a string (#{last_name}) to the end of a string (#{name}): #{name<<last_name}"

# strip method removes leading and trailing white spaces
puts "The strip method removes leading and trailing white spaces from #{hello} and returns #{hello.strip}"

# chars method takes a string and returns an array of characters
puts "The chars method turns #{a_string} into an array, #{a_string.chars}"
