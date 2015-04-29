require('rspec')
require('vehicle')

describe(Vehicle) do
  before do
    Vehicle.clear()
  end
  describe('#make') do
    it('returns the make of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save()
      expect(test_vehicle.make()).to(eq('Nissan'))
    end
  end

  describe('#model') do
    it('returns the model of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save()
      expect(test_vehicle.model()).to(eq('300zx'))
    end
  end

  describe('#year') do
    it('returns the year of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save()
      expect(test_vehicle.year()).to(eq(2005))
    end
  end

  describe('#save') do
    it('adds a behicle to the array of saved vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Vehicle.all()).to(eq([]))
    end

    it('returns all vehicles in the array of vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('.clear') do
    it('empties the array of vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005).save
      expect(Vehicle.clear()).to(eq([]))
    end
  end

  describe('#age') do
    it('returns the age of the vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      expect(test_vehicle.age()).to(eq(10))
    end
  end

  describe('worth_buying?') do
    it("returns 'true' if vehicle is American made and less than 15 years old") do
      test_vehicle = Vehicle.new("Dodge", "Challenger", 2015).save()
      expect(test_vehicle.worth_buying?()).to(eq(true))
    end

    it("returns 'false' if vehicle is not American made and less than 15 years old") do
      test_vehicle = Vehicle.new("Toyota", "Yaris", 2005).save()
      expect(test_vehicle.worth_buying?()).to(eq(false))
    end
  end
end
