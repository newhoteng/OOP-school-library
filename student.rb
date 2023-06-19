require_relative "person.rb"

class Student < Person
  def initialize(age, parent_permission = true, name = "Unknown", classroom)
    super(age, parent_permission = true, name = "Unknown")
    @classroom = classroom
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
