class Classroom
  def initialize(label, students)
    @label = label
    private @students = students
  end

  attr_accessor :label

  def add_student
    @students += 1
  end
end
