require_relative '../capitalizedecorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'initilize test functionality of capitalizedecorator decorator' do
    it 'test correct_name method capitalizes the name' do
      personone = Person.new(34, 'aaa')
      capitalizedecoratortest = CapitalizeDecorator.new(personone)
      expect(capitalizedecoratortest.correct_name).to eq('AAA')
    end
  end
end
