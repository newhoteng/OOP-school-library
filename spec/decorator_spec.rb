require_relative '../capitalize'
require_relative '../trimmer'
require_relative '../person'

describe 'Decorators' do
  before :all do
    @person = Person.new(22, 'maximilianus')
  end

  describe '#capitalize' do
    it 'returns a capitalized name' do
      capitalized_person = CapitalizeDecorator.new(@person)
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end
  end

  describe '#trimmer' do
    it 'returns a name trimmed to 10 characters long if was initially longer' do
      trimmed_person = TrimmerDecorator.new(@person)
      expect(trimmed_person.correct_name).to eq 'maximilian'
    end
  end
end
