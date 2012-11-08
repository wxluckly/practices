class C
  def self.x
    puts "This is method 'x'"
  end

  def self.y
    puts "This is method 'y',about to call x without a dot ."
    x
  end

end

C.y