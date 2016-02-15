require 'net/http'
require 'pry'
require 'json'

my_city = "Boston"
my_state = "MA"
today = Time.now.strftime("%Y-%m-%d")

url = "https://api.seatgeek.com/2/events"
url += "?venue.city=#{my_city}"
url += "&venue.state=#{my_state}"
url += "&datetime_local.gte=#{today}"
url += "&datetime_local.gte=#{today}"

uri = URI(url)
res = Net::HTTP.get_response(uri)
events = JSON.parse(res.body)["events"]
events.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
