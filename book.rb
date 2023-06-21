class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, person)
  end
end
