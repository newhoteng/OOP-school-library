require_relative '../person'

describe Person do
  before :all do
    @person = Person.new(23, 'Harriet')
  end

  describe 'create a new Person object' do
    it 'takes two parameters and returns a Person object' do
      expect(@person).to be_instance_of Person
    end
  end

  describe '.age' do
    it 'returns the correct age' do
      expect(@person.age).to eql 23
    end
  end

  describe '.name' do
    it 'returns the correct name' do
      expect(@person.name).to eql 'Harriet'
    end
  end

  describe '.rentals' do
    it 'has a rentals array' do
      expect(@person).to have_attributes(rentals: [])
    end
  end

  describe '#add_rental method' do
    it 'creates a rental object' do
      book = Book.new('Title', 'Author')
      rental = @person.add_rental(book, '2020/08/03')
      expect(rental).to be_instance_of Rental
    end
  end

  describe '#can_use_services?' do
    it 'check if 18 or older or has parent permission' do
      expect(@person.can_use_services?).to be true
    end
  end

  describe '#correct_name' do
    it 'check if 18 or older or has parent permission' do
      expect(@person.correct_name).to eql 'Harriet'
    end
  end
end
