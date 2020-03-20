require_relative('../models/vehicle')

get '/vehicles' do
  # binding.pry
  @vehicles = Vehicle.all()
  erb(:"vehicles/index")
end
