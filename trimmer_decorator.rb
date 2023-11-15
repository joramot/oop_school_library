require_relative 'decorator'
class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    return unless name.length > 10

    name[0..9]
  end
end
