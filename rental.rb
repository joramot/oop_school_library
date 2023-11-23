require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @person = person
    @book = book
    @date = date
    book.rentals << self
    person.rentals << self
  end

  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }
  end
end
