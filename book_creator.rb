require_relative 'book'

DATA_FILE = 'books_data.json'.freeze
class BookCreator
  def self.create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    save_to_book(book)
    book
  end

  def self.save_to_book(book)
    books_data = load_data || []
    books_data << book.to_h
    File.write(DATA_FILE, JSON.pretty_generate(books_data))
  end

  def self.load_data
    JSON.parse(File.read(DATA_FILE)) if File.exist?(DATA_FILE)
  rescue JSON::ParserError
    puts 'Error parsing JSON data. Returning empty array.'
    []
  end
end
