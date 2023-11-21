require_relative 'classroom'
require_relative 'display'
require_relative 'person_creator'
require_relative 'book_creator'
require_relative 'rental_creator'

class App
  # Defined constants for better readability for person types.
  STUDENT = :student
  TEACHER = :teacher

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_books
    Display.books(@books)
  end

  def display_people
    Display.people(@people)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [enter the number]: '
    person_type = gets.chomp
    case person_type
    when '1' then @people << PersonCreator.create_student
    when '2' then @people << PersonCreator.create_teacher
    else puts 'Person type not recognized. Back to the main menu.'
    end
  end

  def create_book
    @books << BookCreator.create_book
    puts 'Book created successfully'
  end

  def create_rental
    @rentals << RentalCreator.create_rental(@books, @people)
    puts 'Rental created successfully'
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    Display.rentals(@rentals, person_id)
  end
end
