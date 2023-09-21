require 'json'

module LoadModule
  def load_books
    return [] unless File.exist?('books.json')

    data = File.read('books.json')
    books_data = JSON.parse(data)
    books_data.map do |book_data|
      new_book = Book.new(book_data['title'], book_data['author'])
      @books.push(new_book)
    end
  end

  def load_people
    return unless File.exist?('people.json')

    data = File.read('people.json')
    people_data = JSON.parse(data)

    people_data.each do |person_data|
      if person_data['type'] == 'teacher'
        person = Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
      elsif person_data['type'] == 'student'
        person = Student.new(person_data['age'], person_data['name'], person_data['parent_permission'])
      end

      person.id = person_data['id']
      @people.push(person)
    end
  end

  def load_data
    return unless File.exist?('rentals.json')

    data = File.read('rentals.json')
    rentals = JSON.parse(data)
    rentals.each do |rental_data|
      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])

      person_data = rental_data['person']

      person = if person_data['specialization']
                 Teacher.new(person_data['age'], person_data['name'], person_data['specialization'])
               else
                 Student.new(person_data['age'], person_data['name'], person_data['parent_permission'])
               end
      person.id = person_data['id']
      new_rental = Rental.new(rental_data['date'], book, person)
      @rentals.push(new_rental)
    end
  end
end
