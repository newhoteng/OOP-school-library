require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :all do
    @classroom = Classroom.new('Grade 8')
  end

  describe 'create a new Classroom object' do
    it 'takes one parameters and returns a Classroom object' do
      expect(@classroom).to be_instance_of Classroom
    end
  end

  describe '.label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eql 'Grade 8'
    end
  end

  describe '.students' do
    it 'has an array of students' do
      expect(@classroom).to have_attributes(students: [])
    end
  end

  describe '#add_student method' do
    it 'add student to students array' do
      student = Student.new(9, nil, 'Austin')
      @classroom.add_student(student)
      expect(@classroom.students[0].name).to eq('Austin')
      expect(student.classroom.label).to eq('Grade 8')
    end
  end
end
