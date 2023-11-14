class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :age, name
  attr_reader :id

  def can_use_services?
    false unless of_age? && parent_permission == true
  end 

  private
  
  def of_age?
    false unless of_age? >= 18
  end
end
