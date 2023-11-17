require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_books
    @books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def display_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [enter the number]: '
    person_type = gets.chomp
    if person_type != '1' && person_type != '2'
      puts 'Person type not recognized. Back to the main menu.'
      return
    end

    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp

    if person_type == '1'
      create_student(name, age)
    elsif person_type == '2'
      create_teacher(name, age)
    end
  end

  def create_student(name, age)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    parent_permission = true if parent_permission == 'y'
    parent_permission = false if parent_permission == 'n'
    person = Student.new(age, nil, name: name, parent_permission: parent_permission)
    @people << person
    puts 'Student created successfully'
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name: name)
    @people << person
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
