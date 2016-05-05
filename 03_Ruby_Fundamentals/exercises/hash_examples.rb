cars = {}
cars[:tesla] = { year: 2000, model: "Model X", price: 80000 }
cars[:toyota] = { year: 2012, model: "Camry", price: 25000 }
cars2 = {}
cars2[:ford] = { year: 2005, model: "Fusion", price: 20000}

# .length Returns the number of key-value pairs in the hash
puts "#{cars} has #{cars.length} key-value pairs"

# .merge / merge! Returns a new hash containing the contents of 2 hashes
# If no block is specified, the value for entries with duplicate keys will be that of other_hash
# Otherwise the value for each duplicate key is determined by calling the block with the key, its value in hsh and its value in other_hash.
puts "Merging #{cars} and #{cars2} into #{cars.merge(cars2)}"

# .select Returns a new hash consisting of entries for which the block returns true
puts cars[:toyota].select { |k, v| v.to_s > "10000" }

# .keys, .values Returns the keys and values of a hash
puts "The keys of #{cars} are #{cars.keys}"
puts "The values of #{cars} are #{cars.values}"

# .values, values_at Returns an array containing the values associated with the given keys
puts "The value of #{cars} with the key :tesla is #{cars.values_at(:tesla)}"

# .has_key?, .has_value? Returns true if the hash has a given key/value
puts "It is #{cars.has_key?(:tesla)} that #{cars} has the key :tesla"
puts "It is #{cars[:tesla].has_value?("Camry")} that #{cars[:tesla]} has the value Camry"

# .clear Removes all key-value pairs
puts "Removing all key-value pairs from #{cars2}: #{cars2.clear}"
