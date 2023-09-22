require_relative '../rental'
require_relative '../book'
require_relative '../student'

describe Rental do
  let(:book) { Book.new('Things fall apart', 'Chinua Achebe') }
  let(:person) { Student.new(19, 'Edward', true) }
  let(:date) { '23/12/2023' }

  context 'initialize' do
    it 'creates a new rental with the correct attributes' do
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it "adds the rental to the book's rentals" do
      rental = Rental.new(date, book, person)
      expect(book.rentals).to include(rental)
    end

    it "adds the rental to the person's rentals" do
      rental = Rental.new(date, book, person)
      expect(person.rentals).to include(rental)
    end
  end
end
