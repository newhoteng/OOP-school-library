# require './person'
# require './capitalize'
# require './trimmer'
require_relative 'student'

creating name, age, nil, parent_permission / age, nil, name, permission
student name, age, classroom, parent_permission / age, name, classroom, permission
person name, age, parent_permission / age, name, parent_permission

# person = Person.new(22, 'maximilianus')
# p person.correct_name

# capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name

# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name

student = Student.new(12, 'Harriet', false)
p student

# loop do
#   print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
#   number = Integer(gets.chomp)
#   if number == 1 || number == 2
#     break
#   end
# end
