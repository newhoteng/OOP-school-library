require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Load data from database

  def fetch_data(file)
    if File.exist?("data/#{file}.json")
      File.read("data/#{file}.json")
    else
      empty_json = [].to_json
      File.write("data/#{file}.json", empty_json)
      empty_json
    end
  end

  def load_data
    books = JSON.parse(fetch_data('books'))
    people = JSON.parse(fetch_data('people'))
    rentals = JSON.parse(fetch_data('rentals'))

    books.each do |book|
      @books << Book.new(book['title'], book['author'])
    end

    people.each do |person|
      @people << if person['type'] == 'Teacher'
                   Teacher.new(person['age'], person['specialization'], person['name'], parent_permission: true)
                 else
                   Student.new(person['age'], nil, person['name'], parent_permission: person['parent_permission'])
                 end
    end

    rentals.each do |rental|
      rentee = @people.select { |person| person.name == rental['person_name'] }
      rented_book = @books.select { |book| book.title == rental['book_titles'] }
      @rentals << Rental.new(rental['date'], rented_book[0], rentee[0])
    end
  end

  # UIs
  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student(age, _classroon, name, parent_permission)
    case parent_permission
    when 'n'
      student = Student.new(age, nil, name, parent_permission: false)
      @people << student
    when 'y'
      student = Student.new(age, nil, name, parent_permission: true)
      @people << student
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    if number == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase
      create_student(age, nil, name, parent_permission)
    elsif number == 2
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end
    puts 'Person created successfully'
    puts "\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    puts "\n"
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book = gets.chomp.to_i
    puts "\n"

    puts 'Select a person from the following list by number (not ide)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    puts "\n"

    print 'Date: '
    date = gets.chomp

    rented_book = Rental.new(date, @books[book], @people[person])
    @rentals << rented_book

    puts 'Rental created successfully'
    puts "\n"
  end

  def list_rental
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by #{rent.book.author}" if rent.person.id == person_id
    end
  end

  # Save to database
end
