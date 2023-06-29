require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  context 'A student renting a book' do
    it 'should update persons rental array' do
      person = Student.new(15, nil, 'Kyei')
      book = Book.new('Game of Thrones', 'George Martins')
      rental = Rental.new('2023/06/28', book, person)
      expect(rental.person.name).to eq('Kyei')
      expect(rental.book.author).to eq('George Martins')
      expect(person.rentals[0].book.title).to eq('Game of Thrones')
    end
  end
end
