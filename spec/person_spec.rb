require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(23, 'Harriet')
  end

  describe "#new" do
    it "takes two parameters and returns a Person object" do
      @person.should be_an_instance_of Person
    end
  end

  describe "#age" do
    it "returns the correct age" do
      @person.age.should eql 23
    end
  end

  describe "#name" do
    it "returns the correct name" do
      @person.name.should eql 'Harriet'
    end
  end

  describe "#rentals" do
    it "has a rentals array" do
      expect(@person).to have_attributes(rentals: [])
    end
  end
end
