require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('controllers/tours_controller')
require_relative('controllers/tourists_controller')
require_relative('controllers/bookings_controller')
require_relative('controllers/vehicles_controller')



get '/' do
  erb(:home)
end
