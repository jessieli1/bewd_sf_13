cars = {}
cars[:tesla] = { year: 2000, model: "Model X", price: 80000 }
cars[:toyota] = { year: 2012, model: "Camry", price: 25000 }
cars2 = {}
cars2[:ford] = { year: 2005, model: "Fusion", price: 20000}

# .length Returns the number of key-value pairs in the hash.
puts "#{cars} has #{cars.length} key-value pairs"

# .merge / merge! Returns a new hash containing the contents of 2 hashes
# If no block is specified, the value for entries with duplicate keys will be that of other_hash
# Otherwise the value for each duplicate key is determined by calling the block with the key, its value in hsh and its value in other_hash.
puts "Merging #{cars} and #{cars2} into #{cars.merge(cars2)}"

# .select Returns a new hash consisting of entries for which the block returns true
puts cars
puts cars[:tesla].select { |k, v| v < 50000 }

# .keys, .values

# .values, values_at

# .has_key?, .has_value?
