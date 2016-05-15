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

def connect_to_api(url, api, csv)
  response = Typhoeus.get(url)
  json = JSON.parse(response.body)
  find_stories(json, api, csv)
end

def find_stories(json, api, csv)
  if api == 'reddit'
    find_reddit_stories(json, api, csv)
  elsif api == 'mashable'
    find_mashable_stories(json, api, csv)
  else
    puts "ERROR: Unrecognized API #{api}"
  end
end

def find_reddit_stories(json, api, csv)
  stories = json['data']['children']
  print_stories(stories, api, csv)
end

def find_mashable_stories(json, api, csv)
  stories = json['new']
  print_stories(stories, api, csv)
end

def print_stories(stories, api, csv)
  stories.each do |story|
    story = create_story_hash(story, api, csv)
    add_story_to_csv(story, csv)
    puts "Title: #{story[:title]}, Upvotes: #{story[:upvotes]}, Category: #{story[:category]}, Source: #{api}\n\n"
  end
end

def create_story_hash(story, api, csv)
  if api == 'reddit'
    story_hash = {
      :title => story['data']['title'],
      :upvotes => story['data']['ups'],
      :category => story['data']['subreddit']
    }
  elsif api == 'mashable'
    story_hash = {
      :title => story['title'],
      :upvotes => story['shares']['total'],
      :category => story['channel']
    }
  else
    puts "ERROR: No hash generated"
  end
end

def new_csv(csv, *column_names)
  CSV.open(csv, 'wb') do |csv|
    csv << [column_names]
  end
end

def add_story_to_csv(story, csv)
  CSV.open(csv, 'a+') do |csv|
    csv << [ story[:title], story[:upvotes], story[:category] ]
  end
end

def print_csv(file_name)
  p CSV.read(file_name)
end

# ==================================================

reddit_url = 'http://www.reddit.com/.json'
new_csv('reddit_stories.csv', 'title', 'upvotes', 'category')
connect_to_api(reddit_url, 'reddit', 'reddit_stories.csv')
print_csv('reddit_stories.csv')

# ==================================================

mashable_url = 'http://mashable.com/stories.json'
new_csv('mashable_stories.csv', 'title', 'upvotes', 'category')
connect_to_api(mashable_url, 'mashable', 'mashable_stories.csv')
print_csv('mashable_stories.csv')
