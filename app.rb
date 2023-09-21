require './student'
require './teacher'
require './book'
require './rental'
require 'json'
class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
    load_books
    load_data
  end
  ############### 
  # CREATE PERSON
  ############### 
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
  # list person 
  def listpeople
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "(#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      else
        puts "(#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age:#{person.age}"
      end
    end
  end

  ############### 
  # CREATE BOOK
  ###############
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

  
  ############### 
  # CREATE RENTAL
  ###############
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

  ############### 
  # LOAD DATA
  ###############
  #LOAD BOOK
  def load_books
    return [] unless File.exist?('books.json')
  
    data = File.read('books.json')
    books_data = JSON.parse(data)
    books_data.map { |book_data| 
    new_book =Book.new(book_data['title'], book_data['author']) 
    @books.push(new_book)
    }
  end

  def load_data
    return unless File.exist?('rentals.json')
  
    data = File.read('rentals.json')
    rentals = JSON.parse(data)
    rentals.each do |rental_data|
      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])
      
      person_data = rental_data['person']
  
      if person_data['specialization']
        person = Teacher.new(person_data['age'], person_data['name'], person_data['specialization'])
      else
        person = Student.new(person_data['age'], person_data['name'], person_data['parent_permission'])
      end
      person.id=person_data['id']
      new_rental = Rental.new(rental_data['date'], book, person)
      @rentals.push(new_rental)
    end
  end
  
  ############### 
  # SAVE DATA
  ###############

  # SAVE BOOK
  def save_books
    books_data = @books.map do |book|
      {
        'title' => book.title,
        'author' => book.author
      }
    end
    File.write('books.json', JSON.pretty_generate(books_data))
  end

  #SAVE RENTAL
  def save_data
    rentals_data = @rentals.map do |rental|
      person_data = {
        'age' => rental.person.age,
        'name' => rental.person.name,
        'id' => rental.person.id,
        'parent_permission' => rental.person.parent_permission
      }

      person_data['specialization'] = rental.person.specialization if rental.person.is_a?(Teacher)

      {
        'date' => rental.date,
        'book' => {
          'title' => rental.book.title,
          'author' => rental.book.author
        },
        'person' => person_data
      }
    end
    File.write('rentals.json', JSON.pretty_generate(rentals_data))
  end


  ############### 
  # EXIT APP
  ###############
  def exit_app
    puts 'Thank for using this app!'
    save_data
    save_books
    exit
  end
end
