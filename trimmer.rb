require_relative 'decorator.rb'

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name.slice(0, 10)
  end
end
