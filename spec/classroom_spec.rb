require_relative '../classroom'

describe Classroom do
  context 'initialize students' do
    let(:classroom1) { Classroom.new('ML learning lab') }

    it 'check whether add students method adds students' do
      student1 = double('student')
      student2 = double('student')

      allow(student1).to receive(:name) { 'Edward' }
      allow(student1).to receive(:classroom=)
      allow(student2).to receive(:name) { 'mamadou' }
      allow(student2).to receive(:classroom=)
      classroom1.add_students(student1)
      classroom1.add_students(student2)
      expect(classroom1.students.length).to eq(2)
    end
    it 'test classroom label assignment' do
      expect(classroom1.label).to_not eq('Security')
    end
  end
end
