require_relative 'book'
require_relative 'person'

class Rental
  def initialize(date, book, person)
    @person = person
    @book = book
    @date = date
    book.rental << self
    person.rental << self
  end

  attr_reader :book, :person
  attr_accessor :date
end
