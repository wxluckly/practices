require 'rubygems'
require "json"

a = "{\"recommendedItems\":{\"item\":[{\"value\":\"4.2\",\"id\":\"101\"},{\"value\":\"4.2\",\"id\":\"104\"},{\"value\":\"4.0\",\"id\":\"106\"},{\"value\":\"3.5\",\"id\":\"103\"},{\"value\":\"3.0\",\"id\":\"102\"}]}}\r\n"


JSON.parse(a)["recommendedItems"]["item"].each do |item|
p item["id"]
end