require('pry-byebug')
require_relative('models/vehicle.rb')
require_relative('models/tour.rb')

binding.pry
vehicle = Vehicle.get_by_id(0)

tour1 = Tour.new({
  "name" => "Edinburgh 1 day",
  "start_date" => "2020-05-05",
  "days" => 1,
  "price" => 45,
  "pic_url" => "/imgs/dugald_steware_monument_Edinburgh.jpg",
  "vehicle_id" => 0
})
tour1.save()

tour1.get_vehicle_by_id()

nil
