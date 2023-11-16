class Student < Person
  def initialize(age, classroom, name = 'UnKnown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def enroll(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
