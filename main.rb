require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  app.load_data
  app_menu = Menu.new
  puts 'Welcome to School Library App!'
  loop do
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    selected = gets.chomp.to_i
    break if selected == 7

    app_menu.select_option(selected, app)
  end
  app.save_books
  app.save_people
  app.save_rentals
  puts 'Thank you for using this app!'
  puts "\n"
end

main
