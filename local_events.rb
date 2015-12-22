require 'net/http'
require 'pry'
require 'json'

uri = URI("http://api.seatgeek.com/2/events?venue.city="+ARGV[0])
parse = JSON.parse(Net::HTTP.get(uri))

parse["events"].each do |event|
  puts event["title"] + " @ " + event["venue"]["name"]
end
