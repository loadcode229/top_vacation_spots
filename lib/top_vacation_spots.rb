require_relative "./top_vacation_spots/version"
require "httparty"
require "pry"
require_relative "./top_vacation_spots/cli"
require_relative "./top_vacation_spots/scraper"
require_relative "./top_vacation_spots/vacation"

module TopVacationSpots
  class Error < StandardError; end
  # Your code goes here...
end
