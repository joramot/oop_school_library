require_relative 'student'
require_relative 'teacher'
class PersonCreator
  def self.create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(age, nil, name: name, parent_permission: parent_permission)
  end

  def self.create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name: name)
  end
end
