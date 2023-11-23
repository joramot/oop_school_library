require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name: 'unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_h
    classroom_label = @classroom&.label
    super.merge({
                  classroom: classroom_label
                })
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
