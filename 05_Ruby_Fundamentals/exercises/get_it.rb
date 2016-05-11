#1 - Pull the json from the reddit API via
  # http://www.reddit.com/.json
  # http://mashable.com/stories.json
#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along (max of 25 provided)
#4 - Create a new story hash out of each story with the following keys :title, :upvotes and :category
    #title, #category and #upvotes may not be the names use
#5 - Add each story to an array
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'typhoeus'#library that faciltates http requests
require 'pry'
require 'pry-byebug'
require 'json'
require 'csv'

def connect_to_api(url)
  response = Typhoeus.get(url)
  return JSON.parse(response.body)
end

def stories(json)
  return json['data']['children']
end

def create_story_hash(story)
  return story_hash = {
    :title => story['data']['title'],
    :upvotes => story['data']['ups'],
    :category => story['data']['subreddit']
  }
end

def create_story_array(stories)
  story_array = []
  stories.each do |story|
    story_hash = create_story_hash(story)
    story_array.push(story_hash)
  end
  return story_array
end

def print_stories(story_array)
  story_array.each do |story|
    puts "Title: #{story[:title]}"
    puts "Upvotes: #{story[:upvotes]}"
    puts "Category: #{story[:category]}\n\n"
  end
end

def print_reddit_stories(url)
  json = connect_to_api(url)
  all_stories = stories(json)
  story_array = create_story_array(all_stories)
  print_stories(story_array)
end

# ==================================================

def create_csv(file_name, *column_names)
  CSV.open(file_name, 'wb') do |csv|
    csv << [column_names]
  end
end

def print_csv(file_name)
  puts CSV.read(file_name)
end

def add_story_to_csv(file_name, story_array)
  story_array.each do |story|
    stories_csv = CSV.read(file_name)
    story_to_add = [ story[:title], story[:upvotes], story[:category] ]
    CSV.open(file_name, 'a+') do |csv|
      csv << story_to_add
    end
  end
end

def create_reddit_csv(url, file_name, *column_names)
  json = connect_to_api(url)
  all_stories = stories(json)
  story_array = create_story_array(all_stories)
  create_csv(file_name, column_names)
  add_story_to_csv(file_name, story_array)
  print_csv(file_name)
end

# ==================================================

url = 'http://www.reddit.com/.json'
print_reddit_stories(url)
create_reddit_csv(url, 'stories.csv', 'title', 'upvotes', 'category')

# ==================================================

url2 = 'http://mashable.com/stories.json'
# json.keys >> ["new", "rising", "hot", "channel"]
# json['new'].size >> 10
# json['new'][0].class >> hash
# json['new'][0].size >> 28
# json['new'][0]['title']
# json['new'][0]['shares']['total']
# json['new'][0]['channel']
