require_relative '../teacher'

describe Teacher do
  context 'with valid inputs' do
    let(:new_teacher) { Teacher.new(30, 'Mathematics', 'Ahmed') }
    it '#test can make services functionality' do
      expect(new_teacher.can_use_services?).to eq(true)
    end
    it 'test name method' do
      expect(new_teacher.name).to eq('Ahmed')
    end
  end
end
