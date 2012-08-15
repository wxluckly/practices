require 'rubygems'
require 'drhdao'

brands = ['瑷露德玛']
result = []

brands.each do |brand|
  sql = "SELECT id FROM items WHERE brand LIKE '?'"
  ids = DrhModels::Item.find_by_sql([sql,brand])
  ids.each do |id|
    result << id
  end
end
p result
p 'all done sir'
