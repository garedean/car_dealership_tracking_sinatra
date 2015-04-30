require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle.rb')
require('./lib/dealership.rb')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
  erb(:dealership_form)
end

post('/dealerships') do
  Dealership.new(params.fetch('name')).save()
  redirect to('/dealerships')
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i)
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i)
  @dealership_id = @dealership.id()
  erb(:vehicle_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year').to_i
  dealership_id = params.fetch('dealership_id').to_i

  @dealership = Dealership.find(dealership_id)
  @dealership.add_vehicle(Vehicle.new(make, model, year).save())

  erb(:success)
end

get('/dealerships/:dealer_id/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id').to_i)
  @dealership = Dealership.find(params.fetch('dealer_id').to_i)
  erb(:vehicle)
end

get('/reset') do
  Dealership.clear()
  Vehicle.clear()
  redirect to('/')
end
