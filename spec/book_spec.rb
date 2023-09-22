require 'rspec'
require_relative '../book'

describe Book do
  let(:new_book) { Book.new('Game of thrones', 'shelby') }

  describe '#initialize' do
    it 'creates a new Book' do
      expect(new_book).to be_a(Book)
    end
    it 'sets the title' do
      expect(new_book.title).to eq('Game of thrones')
    end
    it 'sets the author' do
      expect(new_book.author).to eq('shelby')
    end
  end
end
