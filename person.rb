require_relative 'nameable'
class Person < Nameable
  attr_accessor :age, name
  attr_reader :id, :rental

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    false unless of_age? && parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    false unless of_age? >= 18
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
