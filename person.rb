class Person
  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def initialize(age, parent_permission = true, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private
  def of_age?
    return true if @age >= 18
    false
  end

  public
  def can_use_services?
    return true if (of_age? || @parent_permission)
    false
  end
end

my_person1 = Person.new(20)
my_person2 = Person.new(4)

# puts my_person1.of_age?
puts my_person1.can_use_services?

# puts my_person2.of_age?
puts my_person2.can_use_services?

puts my_person1.id
