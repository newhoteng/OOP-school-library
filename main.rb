require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  app.load_data
  app_menu = Menu.new
  puts 'Welcome to School Library App!'
  loop do
    app_menu.show_menu
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
