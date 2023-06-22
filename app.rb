require_relative 'student'
require_relative 'teacher'
require_relative 'book'

# require './student'
# require './teacher'
# require './book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
  end

  def create_a_person
    number = nil
    until (number == 1 or number == 2)
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]: " 
      number = gets.chomp.to_i
    end

    age = 0
    until (age != 0)
      print "Age: "
      age = gets.chomp.to_i
    end

    print "Name: "
    name = gets.chomp

    if number == 1
      parent_permission = nil
      until (parent_permission == 'n' || parent_permission == 'y')
        print "Has parent permission? [Y/N]: "
        parent_permission = gets.chomp.downcase
      end

      case parent_permission
      when 'n'
        student = Student.new(age, name, nil, parent_permission: false)
        # @people << student
        # p student
      when 'n'
        student = Student.new(age, name, nil, parent_permission: true)
        # @people << student
        # p student
      end
    elsif number == 2
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      # @people << teacher
      # p teacher
    end
    puts "Person created successfully"
    puts "\n"
  end

  def create_book
    print "Title: " 
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    # @book << book
    # p book
    puts "Book created successfully"
    puts "\n"
  end

end


