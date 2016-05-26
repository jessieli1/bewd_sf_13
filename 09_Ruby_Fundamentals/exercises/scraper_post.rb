# 1. Determine tools needed
# 2. Set goals
# 3. Develop game plan - 5 steps that need to be written

require 'pry'
require 'pry-byebug'
require 'mechanize'
require 'csv'
require_relative 'apartment'

# create an instsance of mechanize
# mechanize will create an instance of everything on the page
def scrape_connect
  Mechanize.new
end

def scrape_it
  scrape_connect.history_added = Proc.new { sleep 20.0 } # called every 20 seconds, prevents lockout

end

binding.pry
scraper = scrape_connect
