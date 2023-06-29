require_relative '../student'

describe Student do
  before :each do
    @student = Student.new(9, nil, 'Austin')
  end

  describe 'Create a new Student object' do
    it 'takes three parameters and returns a Student object' do
      expect(@student).to be_instance_of Student
    end
  end

  describe '.age' do
    it 'returns the correct age' do
      expect(@student.age).to eql 9
    end
  end

  describe '.classroom' do
    it 'returns the correct classroom' do
      expect(@student.classroom).to be_nil
    end
  end

  describe '.name' do
    it 'returns the correct name' do
      expect(@student.name).to eql 'Austin'
    end
  end

  describe '.rentals' do
    it 'has a rentals array from inheriting from Person class' do
      expect(@student).to have_attributes(rentals: [])
    end
  end

  describe '#play_hooky' do
    it 'returns correct value' do
      expect(@student.play_hooky).to eql '"¯\(ツ)/¯"'
    end
  end
end
