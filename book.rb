class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def intialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
