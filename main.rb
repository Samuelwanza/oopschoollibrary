require './app'

def menu
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  puts "Welcome to School Library App!\n\n"
  puts 'Please choose an option by entering a number:'
  app1 = App.new
  options = {
    '1' => :listbooks,
    '2' => :listpeople,
    '3' => :createperson,
    '4' => :createbook,
    '5' => :createrental,
    '6' => :listpersonsrentals,
    '7' => :exit_app
  }

  loop do
    menu
    choice = gets.chomp
    if options.key?(choice)
      action = options[choice]
        app1.send(action)
    else
      puts 'Invalid entry'
    end
  end
end

main
