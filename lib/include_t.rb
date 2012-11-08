
module Printable
  def print
    p 'Printable print'
  end

  def prepare_cover

  end

end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen

  end

  def print
    p 'Document print'
  end

  
end

class Book
  include Document
  include Printable

end


b = Book.new
b.print_to_screen

