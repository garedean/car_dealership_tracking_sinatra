require('rspec')
require('vehicle')

describe(Vehicle) do
  before do
    Vehicle.clear()
  end
  describe('#make') do
    it('returns the make of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(test_vehicle.make()).to(eq('Nissan'))
    end
  end

  describe('#model') do
    it('returns the model of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(test_vehicle.model()).to(eq('300zx'))
    end
  end

  describe('#year') do
    it('returns the year of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(test_vehicle.year()).to(eq(2005))
    end
  end

  describe('#save') do
    it('adds a behicle to the array of saved vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Vehicle.all()).to(eq([]))
    end

    it('returns all vehicles in the array of vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('.clear') do
    it('empties the array of vehicles') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(Vehicle.clear()).to(eq([]))
    end
  end

  describe('#age') do
    it('retunrns the age of the vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      expect(test_vehicle.age()).to(eq(10))
    end
  end
end
