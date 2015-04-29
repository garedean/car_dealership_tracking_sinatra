require('rspec')
require('dealership')
require('vehicle')

describe(Dealership) do

  before do
    Dealership.clear()
  end

  describe('#name') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new('Eds Cars').save()
      expect(test_dealership.name()).to(eq('Eds Cars'))
    end
  end

  describe('#id') do
    it('returns the id of the dealership') do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it('initially returns an empty array of cars for that dealership') do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(test_dealership.cars()).to(eq([]))
    end

    it('returns array of cars after some exist') do
      test_dealership = Dealership.new("Bob's Used Cars").save()
      test_vehicle = Vehicle.new("Ford", "Bronco", 1968)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end

  describe('#save') do
    it('saves the dealership into the array of dealerships') do
      test_dealership = Dealership.new('Eds Cars').save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.all') do
    it('returns an array of all dealerships') do
      test_dealership = Dealership.new('Eds Cars').save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end

    it('is empty at first') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties the array of dealerships') do
      Dealership.new('Eds Cars').save()
      expect(Dealership.clear()).to(eq([]))
    end
  end

  describe('#add_vehicle') do
    it("adds a new vehicle to a dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end

  describe('.find') do
    it('Finds a dealership by id') do
      test_dealership1 = Dealership.new('Eds cars').save()
      test_dealership2 = Dealership.new('Bobs cars').save()
      expect(Dealership.find(test_dealership1.id())).to(eq(test_dealership1))
    end
  end

end
