require_relative '../solver'

describe Solver do
  let(:new_factorial) { Solver.new() }

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
end
