require 'rspec'
require_relative '../person'

describe Person do
  let(:new_person) { Person.new(23, 'Jack', true) }

  describe '#initialize' do
    it 'creates a new person' do
      expect(new_person).to be_a(Person)
    end
    it 'sets the age of the person' do
      expect(new_person.age).to eq(23)
    end
    it 'sets the name of the person' do
      expect(new_person.name).to eq('Jack')
    end
    it 'should give true for parent permission' do
      expect(new_person.parent_permission).to eq(true)
    end
    it 'should give the type of id in integer' do
      expect(new_person.id).to be_a(Integer)
    end
  end
end
