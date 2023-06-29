require_relative '../teacher'

describe Teacher do
  before :all do
    @teacher = Teacher.new(45, 'Home Economics', 'Barbara')
  end

  describe 'Create Teacher object' do
    it 'takes three parameters and returns a Teacher object' do
      expect(@teacher).to be_instance_of Teacher
    end
  end

  describe '.age' do
    it 'returns the correct age' do
      expect(@teacher.age).to eql 45
    end
  end

  describe '.specialization' do
    it 'returns the correct specialization' do
      expect(@teacher.specialization).to eql 'Home Economics'
    end
  end

  describe '.name' do
    it 'returns the correct name' do
      expect(@teacher.name).to eql 'Barbara'
    end
  end

  describe '.rentals' do
    it 'has a rentals array from inheriting from Person class' do
      expect(@teacher).to have_attributes(rentals: [])
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
