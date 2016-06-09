json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :animal_type, :age, :available, :image
  json.url animal_url(animal, format: :json)
end
