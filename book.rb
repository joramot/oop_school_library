class Book
  def initialize(title, author, rentals)
    @title = title
    @author = author
    private @rentals = rentals
  end

  def add_rental
    @rentals += 1
  end
end
