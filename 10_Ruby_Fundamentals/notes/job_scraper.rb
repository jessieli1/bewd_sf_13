require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require_relative 'job'

def scrape_connect
  Mechanize.new
end

def scrape_it(url, csv)
  scrape_connect.history_added = Proc.new { sleep 20.0 }
  inputs = get_user_inputs

  scrape_connect.get(url) do |search|
    form_values = search.form_with(id: 'searchform') do |s|
      s['query'] = inputs[:query]
      s['postal'] = inputs[:zip]
      s['search_distance'] = inputs[:distance]
      if inputs[:full_time] == 'y'
        s.checkbox_with(:id => 'full-time_1').check
      end
      if inputs[:part_time] == 'y'
        s.checkbox_with(:id => 'part-time_2').check
      end
      if inputs[:contract] == 'y'
        s.checkbox_with(:id => 'contract_3').check
      end
      if inputs[:choice] == 'y'
        s.checkbox_with(:id => "employee's_choice_4").check
      end
    end

    raw_results = search_results(form_values)
    parse_results(raw_results, csv)
  end
end

def get_user_inputs
  inputs = Hash.new
  q = get_user_query
  zip_distance = get_zip
  emp_type = get_emp_type
  inputs = {
    query: q,
    zip: zip_distance[:zip],
    distance: zip_distance[:distance],
    full_time: emp_type[:full_time],
    part_time: emp_type[:part_time],
    contract: emp_type[:contract],
    choice: emp_type[:choice]
  }
end

def get_user_query
  puts "What query do you want to search? (Enter to skip)\n"
  return gets.chomp
end

def get_zip
  zip_distance = Hash.new
  puts "What zip code do you want to search? (Enter to skip)\n"
  zip = gets.chomp
  if zip != ''
    puts "How many miles do you want to search? (Enter to skip)\n"
    distance = gets.chomp.to_i
  end
  zip_distance = {
    zip: zip,
    distance: distance
  }
end

def get_emp_type
  emp_type = Hash.new
  puts "Please respond 'y' for yes, any other key for 'n'"
  puts "Do you want to search full-time jobs?\n"
  full_time = gets.chomp
  puts "Do you want to search part-time jobs?\n"
  part_time = gets.chomp
  puts "Do you want to search contract jobs?\n"
  contract = gets.chomp
  puts "Do you want to search flexible jobs?\n"
  choice = gets.chomp
  emp_type = {
    full_time: full_time,
    part_time: part_time,
    contract: contract,
    choice: choice
  }
end

def search_results(form_values)
  results = form_values.submit
  results.search('p.row')
end

def parse_results(raw_results, csv)
  results = []
  results << ['name', 'url', 'location', 'address', 'type', 'comp']

  raw_results.each do |result|
    name = result.search('span#titletextonly').text
    url = 'https://sfbay.craigslist.org' << result.css('a')[1].attributes['href'].value
    location = result.search('small').text.strip.delete("("+")")

    detail_results = scrape_link(url)
    address = detail_results[:address]
    type = detail_results[:type]
    comp = detail_results[:comp]

    job = Job.new(name, url, location, address, type, comp)
    results << [job.name, job.url, job.location, job.address, job.type, job.comp]
    create_csv(results, csv)
  end
end

def scrape_link(url)
  detail_results = Hash.new
  comp = scrape_connect.get(url).search('b')[0].text
  type = scrape_connect.get(url).search('b')[1].text
  address = scrape_connect.get(url).search('div.mapaddress').text
  return detail_results = {
    comp: comp,
    type: type,
    address: address
  }
end

def create_csv(results, csv)
  CSV.open(csv, 'w+') do |csv|
    results.each do |row|
      csv << row
    end
  end
end

def read_csv(file_name)
  CSV.foreach(file_name) do |row|
    puts row
    puts "\n"
  end
end

# =================

url = 'https://sfbay.craigslist.org/search/jjj'
csv = 'jobs.csv'
scrape_it(url, csv)
read_csv(csv)
