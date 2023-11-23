require_relative 'rental'
DATA_FILE = 'rentals_data.json'.freeze

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
    rental = Rental.new(date, books[book_index], people[person_index])
    save_to_rental(rental)
    rental
  end

  def self.save_to_rental(rental)
    rentals_data = load_data || []
    rentals_data << rental.to_h
    File.write(DATA_FILE, JSON.pretty_generate(rentals_data))
  end

  def self.load_data
    JSON.parse(File.read(DATA_FILE)) if File.exist?(DATA_FILE)
  rescue JSON::ParserError
    puts 'Error parsing JSON data. Returning empty array.'
    []
  end
end
