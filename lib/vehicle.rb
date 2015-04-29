class Vehicle

  @@vehicles = []

  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    @id = @@vehicles.length() + 1
  end

  define_method(:save) do
    @@vehicles.push(self)
    self
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:id) do
    @id
  end

  define_method(:age) do
    Time.now().year - @year
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "Dodge"]

    american_cars.include?(make).&(age.<(15))
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_singleton_method(:find) do |id|
    vehicle_match = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id() == id
        vehicle_match = vehicle
      end
    end
    vehicle_match
  end
end
