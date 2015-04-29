require('rspec')
require('vehicle')

describe(Vehicle) do
  describe('#make') do
    it('returns the make of a vehicle') do
      test_vehicle = Vehicle.new('Nissan', '300zx', 2005)
      test_vehicle.save()
      expect(test_vehicle.make()).to(eq('Nissan'))
    end
  end
end
