require_relative 'book'
require_relative 'person'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @person = person
    @book = book
    @date = date
   book.rentals << self
   person.rentals << self
  end
end
