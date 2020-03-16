require_relative("../models/tour.rb")
require_relative("../models/tourist.rb")
require("pry-byebug")

Tour.delete_all()
Tourist.delete_all()

tour1 = Tour.new({
  "name" => "Edinburgh 1 day",
  "start_date" => "2020-05-05",
  "days" => 1,
  "price" => 45,
  "pic_url" => "/imgs/dugald_steware_monument_Edinburgh.jpg"
})
tour1.save()

tour2 = Tour.new({
  "name" => "Highland 2 days",
  "start_date" => "2020-05-06",
  "days" => 2,
  "price" => 99,
  "pic_url" => "/imgs/Glencoe.jpg"
})
tour2.save()

tour3 = Tour.new({
  "name" => "Highland skye lochness 3 days",
  "start_date" => "2020-05-07",
  "days" => 3,
  "price" => 149,
  "pic_url" => "/imgs/kilt_rock_water_fall.jpg"
})
tour3.save()

tour4 = Tour.new({
  "name" => "Glasgow loch lomond stiring 1 day",
  "start_date" => "2020-05-08",
  "days" => 1,
  "price" => 49,
  "pic_url" => "/imgs/loch-lomond.jpg"
})
tour4.save()

tour5 = Tour.new({
  "name" => "Highland lochness 1 day",
  "start_date" => "2020-05-09",
  "days" => 1,
  "price" => 69,
  "pic_url" => "/imgs/lochness.jpg"
})
tour5.save()

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
