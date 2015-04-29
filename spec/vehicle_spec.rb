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
end
