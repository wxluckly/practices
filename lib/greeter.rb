# To change this template, choose Tools | Templates
# and open the template in the editor.

class Greeter
  def initialize(name)
    @name =name
  end
  def say(phrase)
    puts "#{phrase},#{@name}"
  end
end

g1 = Greeter.new("Fred")
g2 = Greeter.new("Wilma")

g1.say("Hello")
g2.say("Hi")

