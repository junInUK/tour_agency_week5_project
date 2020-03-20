require_relative('../models/tour')
require_relative('../models/vehicle')

get '/tours' do
  # binding.pry 
  @tours = Tour.all()
  erb(:"tours/index")
end

post '/tours' do
  @tour = Tour.new(params)
  @tour.save
  erb(:"tours/create")
end

get '/tours/new' do
  @vehicles = Vehicle.all()
  erb(:"tours/new")
end

post '/tours/:id/delete' do
  Tour.destroy(params[:id])
  redirect to("/tours")
end

get '/tours/:id/edit' do
  # binding.pry
  @vehicles = Vehicle.all()
  @tour = Tour.find(params[:id])
  erb(:"tours/edit")
end

post '/tours/:id' do
  @tour = Tour.new(params)
  @tour.update
  erb(:"tours/show")
end

get '/tours_of_tourist/:id' do
  @tours = Tour.get_by_tourist(params[:id])
  erb(:"tours/get_by_tourist")
end
