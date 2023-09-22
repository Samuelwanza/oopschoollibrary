require 'rspec'
require_relative '../student'

describe Student do
  let(:new_student) { Student.new(19, 'Edward', true) }

  describe '#initialize' do
    it 'creates a new studen' do
      expect(new_student).to be_a(Student)
    end
    it 'sets the age of the person' do
      expect(new_student.age).to eq(19)
    end
    it 'sets the name of the student' do
      expect(new_student.name).to eq('Edward')
    end
    it 'should give true for parent permission' do
      expect(new_student.parent_permission).to eq(true)
    end
    it 'should give the type of id in integer' do
      expect(new_student.classroom).to eq(nil)
    end
  end
end
