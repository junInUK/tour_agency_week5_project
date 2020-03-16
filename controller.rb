require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/tour')
require_relative('models/tourist')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/tours' do
  @tours = Tour.all()
  erb(:tour_index)
end

post '/tours' do
  @tour = Tour.new(params)
  @tour.save
  erb(:tour_create)
end

get '/tours/new' do
  erb(:tour_new)
end

post '/tours/:id/delete' do
  Tour.destroy(params[:id])
  redirect to("/tours")
end

get '/tours/:id/edit' do
  # binding.pry
  @tour = Tour.find(params[:id])
  erb(:tour_edit)
end

post '/tours/:id' do
  @tour = Tour.new(params)
  @tour.update
  erb(:tour_show)
end

get '/tourists' do
  # binding.pry
  @tourists = Tourist.all()
  erb(:tourist_index)
end

get '/bookings' do
#  @bookings = Booking.all()
  erb(:booking_index)
end

get '/bookings/new' do
  # binding.pry
  @tourists = Tourist.all()
  @tours = Tour.all()
  erb(:booking_new)
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  erb(:booking_create)
end
