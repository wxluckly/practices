class Roulette


  def method_missing(name,*args)

    person = name.to_s.capitalize
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} go a #{number}"
  end
end


number_of = Roulette.new
puts number_of.bob
puts number_of.frank


# ------------------------------------------------------------------

#require 'ruport'
#
#table = Ruport::Data::Table.new :column_names => ["country",'wine'],
#                                :data => [["France","Bordeaux"],["Italy","chisare"],["France","Chablis"]]
#
#puts table.to_text


