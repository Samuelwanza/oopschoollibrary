require './student'
require './teacher'
require './book'
require './rental'
class App
  def initialize()
    @books = []
    @people = []
    @rentals = []

  end

  def listbooks
    @books.each_with_index do |book, index|
      puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def listpeople
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "(#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      else
        puts "(#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      end
    end
  end

  def createperson
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    choice = gets.chomp
    if choice == '1'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Has Parent Permission?[Y/N]:'
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase
      if parent_permission == 'n'
        no_parent_permission
      elsif parent_permission == 'y'
        having_parent_permission
      else
        puts 'invalid permission input'
        puts 'person creation failed'
        nil
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
  def no_parent_permission
    student = Student.new(age, name, false, nil) # Provide all four arguments
    @peopl.push(student)
    puts 'Person created successfully'
  end
  def having_parent_permission
    student = Student.new(age, name, true, nil)
    @people.push(student)
    puts 'Person created successfully'
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
end

