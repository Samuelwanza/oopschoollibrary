require_relative '../nameable'
require_relative '../person'

class Testing < Nameable
end
describe Nameable do
  let(:testing) { Testing.new }
  context 'initialize nameable' do
    it 'check  correct_name() method is not implemented in Testing' do
      expect { testing.correct_name }.to raise_error(NotImplementedError)
    end
    it 'checks  checks whether correct_name() method is implemented in Person' do
      persontest = Person.new(21)
      expect(persontest.correct_name).to eq('Unknown')
    end
  end
end
