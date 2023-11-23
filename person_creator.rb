require_relative 'student'
require_relative 'teacher'
require 'json'
class PersonCreator
  DATA_FILE = 'persons_data.json'.freeze

  def self.create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age, nil, name: name, parent_permission: parent_permission)
    save_to_person(student)
    student
  end

  def self.create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name: name)
    save_to_person(teacher)
    teacher
  end

  def self.save_to_person(person)
    persons_data = load_data || []
    persons_data << person.to_h
    File.write(DATA_FILE, JSON.pretty_generate(persons_data))
  end

  def self.load_data
    JSON.parse(File.read(DATA_FILE)) if File.exist?(DATA_FILE)
  rescue JSON::ParserError
    puts 'Error parsing JSON data. Returning empty array.'
    []
  end
end
