require 'json'

module SaveModule
  def save_books
    books_data = @books.map do |book|
      {
        'title' => book.title,
        'author' => book.author
      }
    end
    File.write('books.json', JSON.pretty_generate(books_data))
  end

  def save_people
    people_data = @people.map do |person|
      if person.is_a?(Teacher)
        person_data = {
          'age' => person.age,
          'name' => person.name,
          'id' => person.id,
          'specialization' => person.specialization,
          'type' => 'teacher'
        }
      elsif person.is_a?(Student)
        person_data = {
          'age' => person.age,
          'name' => person.name,
          'id' => person.id,
          'parent_permission' => person.parent_permission,
          'type' => 'student'
        }
      end
      person_data
    end
    File.write('people.json', JSON.pretty_generate(people_data))
  end

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
end
