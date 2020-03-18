require_relative("../models/tour.rb")
require_relative("../models/tourist.rb")
require_relative("../models/booking.rb")
require_relative("../models/vehicle.rb")
require("pry-byebug")

Booking.delete_all()
Tour.delete_all()
Tourist.delete_all()
Vehicle.delete_all()

vehicle1 = Vehicle.new({
  "reg_number" => "SJ17 5FD",
  "brand"      => "MERCEDES-BENZ",
  "seats"      => 8
})
vehicle1.save()

vehicle2 = Vehicle.new({
  "reg_number" => "SJ17 6SK",
  "brand"      => "VOLVO",
  "seats"      => 16
})
vehicle2.save()

vehicle3 = Vehicle.new({
  "reg_number" => "SJ18 3AH",
  "brand"      => "RENAULT",
  "seats"      => 35
})
vehicle3.save()

vehicle4 = Vehicle.new({
  "reg_number" => "SK19 8XP",
  "brand"      => "LAND ROVER DEFENDER",
  "seats"      => 8
})
vehicle4.save()

tour1 = Tour.new({
  "name" => "Edinburgh 1 day",
  "start_date" => "2020-05-05",
  "days" => 1,
  "price" => 45,
  "pic_url" => "/imgs/dugald_steware_monument_Edinburgh.jpg",
  "vehicle_id" => vehicle1.id
})
tour1.save()

tour2 = Tour.new({
  "name" => "Highland 2 days",
  "start_date" => "2020-05-06",
  "days" => 2,
  "price" => 99,
  "pic_url" => "/imgs/Glencoe.jpg",
  "vehicle_id" => vehicle2.id
})
tour2.save()

tour3 = Tour.new({
  "name" => "Highland skye lochness 3 days",
  "start_date" => "2020-05-07",
  "days" => 3,
  "price" => 149,
  "pic_url" => "/imgs/kilt_rock_water_fall.jpg",
  "vehicle_id" => vehicle3.id
})
tour3.save()

tour4 = Tour.new({
  "name" => "Glasgow loch lomond stiring 1 day",
  "start_date" => "2020-05-08",
  "days" => 1,
  "price" => 49,
  "pic_url" => "/imgs/loch-lomond.jpg",
  "vehicle_id" => vehicle4.id
})
tour4.save()

tour5 = Tour.new({
  "name" => "Highland lochness 1 day",
  "start_date" => "2020-05-09",
  "days" => 1,
  "price" => 69,
  "pic_url" => "/imgs/lochness.jpg",
  "vehicle_id" => vehicle1.id
})
tour5.save()

tour6 = Tour.new({
  "name" => "Stiring St Andrew 1 day",
  "start_date" => "2020-05-12",
  "days" => 1,
  "price" => 59,
  "pic_url" => "/imgs/monumento-william-wallace.jpg",
  "vehicle_id" => vehicle2.id
})
tour6.save()

tourist1 = Tourist.new({
  "name" => "jun wu",
  "email" => "junwu2012@hotmail.com",
  "phone_number" => "07902181918",
  "address" => "1 Prince Street Edinburgh",
  "funds" => 1000
})
tourist1.save()

tourist2 = Tourist.new({
  "name" => "sam smith",
  "email" => "sam_smith@hotmail.com",
  "phone_number" => "07902181919",
  "address" => "1 George Street Glasgow",
  "funds" => 2000
})
tourist2.save()

tourist3 = Tourist.new({
  "name" => "Tom halford",
  "email" => "tom_halford@hotmail.com",
  "phone_number" => "07902181920",
  "address" => "21 king Street Aberdeen",
  "funds" => 1500
})
tourist3.save()

tourist4 = Tourist.new({
  "name" => "Adam",
  "email" => "adam@hotmail.com",
  "phone_number" => "07902198176",
  "address" => "498 Union Street Aberdeen",
  "funds" => 1800
})
tourist4.save()

tourist5 = Tourist.new({
  "name" => "John",
  "email" => "john@hotmail.com",
  "phone_number" => "07654345672",
  "address" => "1/13 john street Inverness",
  "funds" => 2200
})
tourist5.save()

booking1 = Booking.new({
  "tour_id" => tour1.id,
  "tourist_id" => tourist1.id,
  "booking_date" => "2020-05-08"
})
booking1.save()

booking2 = Booking.new({
  "tour_id" => tour1.id,
  "tourist_id" => tourist2.id,
  "booking_date" => "2020-05-07"
})
booking2.save()

booking3 = Booking.new({
  "tour_id" => tour1.id,
  "tourist_id" => tourist3.id,
  "booking_date" => "2020-05-06"
})
booking3.save()

booking4 = Booking.new({
  "tour_id" => tour1.id,
  "tourist_id" => tourist4.id,
  "booking_date" => "2020-05-06"
})
booking4.save()

booking5 = Booking.new({
  "tour_id" => tour1.id,
  "tourist_id" => tourist5.id,
  "booking_date" => "2020-05-06"
})
booking5.save()
