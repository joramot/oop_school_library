require_relative 'app'

OPTIONS = {
  '1' => :display_books,
  '2' => :display_people,
  '3' => :create_person,
  '4' => :create_book,
  '5' => :create_rental,
  '6' => :display_rentals,
  '7' => :exit_app
}.freeze

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ''

  loop do
    display_options

    option = gets.chomp
    chosen_option = OPTIONS[option]

    if chosen_option
      app.send(chosen_option)
    else
      puts 'Invalid option. Please try again.'
    end

    puts ''
  end
end

def display_options
  puts 'Please choose an option by entering number:'
  puts '1) List all books'
  puts '2) List all people'
  puts '3) Create a person'
  puts '4) Create a book'
  puts '5) Create a rental'
  puts '6) List all rentals for a given person id'
  puts '7) Exit'
end

def exit_app
  puts 'Thank you for using this app!'
  puts ''
  exit
end

main
