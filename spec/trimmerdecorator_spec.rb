require_relative '../trimmerdecorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'initilize test functionality of trimmer decorator' do
    it 'test correct_name method trims the name' do
      personone = Person.new(34, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
      trimmerdecoratortest = TrimmerDecorator.new(personone)
      expect(trimmerdecoratortest.correct_name).to eq('aaaaaaaaaa')
    end
  end
end
