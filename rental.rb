class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end
  attr_accessor :date
  attr_reader :book, :person
end
