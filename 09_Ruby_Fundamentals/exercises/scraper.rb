require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require_relative 'apartment'

def scraper
  Mechanize.new
end

def scrape(url, csv)
  scraper.history_added = Proc.new { sleep 4.0 } # prevents lockout from Craigslist
  inputs = get_user_inputs
  scraper.get(url) do |page|
    form = page.form_with(:id => 'searchform') do |search|
      search['query'] = inputs[:query]
      search['min_price'] = inputs[:min_price]
      search['max_price'] = inputs[:max_price]
    end
    data_results(form.submit, csv)
  end
end

def get_user_inputs
  inputs = Hash.new
  q = get_user_query
  min = get_user_min_price
  max = get_user_max_price
  until min <= max
    puts "Please enter valid min/max prices\n"
    min = get_user_min_price
    max = get_user_max_price
  end
  inputs = {
    query: q,
    min_price: min,
    max_price: max
  }
end

def get_user_query
  puts "What query do you want to search? (Enter to skip)\n"
  return gets.chomp
end

def get_user_min_price
  puts "What is your minimum price? (Enter to skip)\n"
  return gets.chomp.to_i
end

def get_user_max_price
  puts "What is your maximum price? (Enter to skip)\n"
  return gets.chomp.to_i
end

def data_results(data, csv)
  data.search('p.row').each do |listing|
    add_to_csv(create_apartment(listing), csv)
  end
end

def create_apartment(listing)
  title = listing.search('span#titletextonly').text
  url = 'https://sfbay.craigslist.org' << listing.css('a')[1].attributes['href'].value
  price = listing.search('span.price').text
  location = listing.search('small').text.strip.delete("("+")")
  return Apartment.new(title, url, price, location)
end

def new_csv(csv, *column_names)
  CSV.open(csv, 'wb') do |csv|
    csv << column_names
  end
end

def add_to_csv(apt, csv)
  CSV.open(csv, 'a+') do |csv|
    csv << [ apt.title, apt.url, apt.price, apt.location ]
  end
end

def print_csv(file_name)
  p CSV.read(file_name)
end

def read_csv(file_name)
  CSV.foreach(file_name) do |row|
    puts row
    puts "\n"
  end
end

# =====================

url = 'http://sfbay.craiglist.org/search/sfc/apa'
csv = 'apartments.csv'
new_csv(csv, 'title', 'url', 'price', 'location')
scrape(url, csv)
#print_csv(csv)
read_csv(csv)
