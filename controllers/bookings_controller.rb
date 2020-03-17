require_relative('../models/booking')

get '/bookings' do
  # binding.pry
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get '/bookings/new' do
  # binding.pry
  @tourists = Tourist.all()
  @tours = Tour.all()
  erb(:"bookings/new")
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  erb(:"bookings/create")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end
