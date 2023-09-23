require_relative '../solver'

describe Solver do
  let(:new_factorial) { Solver.new }

  describe '.factorial' do
    it 'should returns 1 when given 0' do
      expect(new_factorial.factorial(0)).to eq(1)
    end

    it 'should calculates the factorial correctly when given a positive integer' do
      expect(new_factorial.factorial(4)).to eq(24)
      expect(new_factorial.factorial(7)).to eq(5040)
    end

    it 'should raises an ArgumentError when given a negative integer' do
      expect { new_factorial.factorial(-1) }.to raise_error(ArgumentError)
    end
  end
  describe '.reverse' do
    it 'should return reverse string' do
      expect(new_factorial.reverse('mahdi')).to eq('idham')
      expect(new_factorial.reverse('samuel')).to eq('leumas')
    end
  end
  describe '.fizzbuzz' do
    it 'should return fizz if number is devision of 3' do
      expect(new_factorial.fizzbuzz(6)).to eq('fizz')
    end
    it 'should return buzz if number is devision of 5' do
      expect(new_factorial.fizzbuzz(10)).to eq('buzz')
    end
    it 'should return fizzbuzz if number is devision of 3 and 5' do
      expect(new_factorial.fizzbuzz(30)).to eq('fizzbuzz')
    end
    it 'should return the number itself if both is not devided by 3, 5, or 3 and 5' do
      expect(new_factorial.fizzbuzz(7)).to eq('7')
    end
  end
end
