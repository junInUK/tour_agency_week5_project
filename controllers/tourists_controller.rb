require_relative('../models/tourist')

get '/tourists' do
  # binding.pry
  @tourists = Tourist.all()
  erb(:"tourists/index")
end

get '/tourists_of_tour/:id' do
  @tourists = Tourist.get_by_tour(params[:id])
  erb(:"tourists/get_by_tour")
end
