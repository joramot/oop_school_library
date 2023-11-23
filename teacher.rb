require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name: 'UnKnown')
    super(age, name: name)
    @specialization = specialization
  end

  def to_h
    super.merge({
                  'specialization' => @specialization
                })
  end

  def can_use_services?
    true
  end
end
