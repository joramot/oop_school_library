require_relative 'rental'

class RentalCreator
  def self.create_rental(books, people)
    puts 'Select a book from the following list by number'
    Display.books(books)
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    Display.people(people)
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    Rental.new(date, books[book_index], people[person_index])
  end
end
