require "rubygems"
require "whenever"


p 'start'
every '*/1 * * * *' do
  p "Hello World"
end
p 'end'

