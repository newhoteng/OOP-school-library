require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# require './student'
# require './teacher'
# require './book'
# require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books
  end

  def create_person
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
        @people << student
        # p student
      when 'n'
        student = Student.new(age, name, nil, parent_permission: true)
        @people << student
        # p student
      end
    elsif number == 2
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      @people << teacher
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
    @book << book
    # p book
    puts "Book created successfully"
    puts "\n"
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book = gets.chomp.to_i
    put "\n"

    puts 'Select a person from the following list by number (not ide)'
    @people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    person = gets.chomp.to_i
    put "\n"

    print "Date: "
    date = gets.chomp

    rented_book = Rental.new(date, @books[book], @people[person])
    @rentals << rented_book

    puts "Rental created successfully"
    puts "\n"
  end

  def list_rental
    print "ID of person: "
    person_id = gets.chomp

    puts "Rentals:"
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book #{rent.book.title} by #{rent.book.author}" if rent.person.id == person_id
    end
  end

end


