require './student'
require './teacher'
require './book'
require './rental'
require 'json'
require_relative 'save_module'
require_relative 'load_module'

class App
  include SaveModule
  include LoadModule
  def initialize()
    @books = []
    @people = []
    @rentals = []
    load_books
    load_data
    load_people
  end

  def createperson
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    choice = gets.chomp
    if choice == '1'
      print 'Age:'
      age = gets.chomp.to_i
      print 'Name:'
      name = gets.chomp
      print 'Has Parent Permission?[Y/N]:'
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase
      if parent_permission == 'n'
        having_parent_permission(age, name, false)
      elsif parent_permission == 'y'
        having_parent_permission(age, name, true)
      else
        puts 'invalid permission input'
        puts 'person creation failed'
      end
    elsif choice == '2'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people.push(teacher)
      puts 'Person created successfully'
    else
      puts 'invalid entry'
    end
  end

  def having_parent_permission(age, name, state)
    student = Student.new(age, name, state, nil)
    @people.push(student)
    puts 'Person created successfully'
  end

  def listpeople
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "(#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      elsif person.instance_of?(Teacher)
        puts "(#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      end
    end
  end

  def createbook
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def listbooks
    @books.each_with_index do |book, index|
      puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def createrental
    puts 'Select a book from the following list by number'
    listbooks
    bookchoice = gets.chomp
    puts "\n\n"
    puts 'Select a person from the following list by number (not id)'
    listpeople
    personchoice = gets.chomp
    puts "\n\n"
    print 'Date:'
    date = gets.chomp
    rental = Rental.new(date, @books[bookchoice.to_i], @people[personchoice.to_i])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def listpersonsrentals
    print 'ID of person:'
    personsid = gets.chomp
    @rentals.map do |rental|
      if rental.person.id == personsid.to_i
        puts "Date: #{rental.date} Book '#{rental.book.title}' by #{rental.book.author} "
      end
    end
  end

  def exit_app
    puts 'Thank for using this app!'
    save_data
    save_books
    save_people
    exit
  end
end
