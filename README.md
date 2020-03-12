Tour Agency 

Nan is the boss of a tour agency in Edinburgh. He built his business 6 years before. As the business grows, he is struggling with managing his business using a pen and notebook. He heard that you are an expert of software and wondered if you could build a piece of software to help him manage his business bookings and logic. 

MVP(Basic requirements)

1. The app should allow CRUD tours. Tours may have the properties like name, start date, how long(1 day, 2 days or 3 days or even more), price, (option img url). 
2. The app should allow CRUD tourists. Tourists may have the properties like name, phone number, email address, home address. ( in case the agency may need to send a bill to a tourist!)
3. The app should allow tourists to book their tours. One tourist can book many tours. And one tour can have many tourists.
4. The app should allow show all tourists that are booked in for a particular tour. 
5. The app should allow show all tours that a particular tourist booked. 

Extensions( further requirements )

1. Booking a tour should decrease the funds of the tourist by the price. ( add the property of funds in Class Tourist)
2. Check how much a tourist needs to pay.
3. Check how many tourists are going to join a particular tour. 

Advanced Extensions ( advanced requirements )

1. Most of the tours may need a suitable vehicle to carry all the tourists. Vehicles may have limited seats. Create a class vehicle holding the properties like registration number, number of seats. 
2. Nan wishes to check how many seats are left for a particular tour, so he may do some promoting like give tourists 10% discounts if the available seats below 10% of all the seats.  

More than Advanced Extensions ( greedy requirements )

1. Nan wishes to know the total money of all the bookings! 

2. If you wish to update more than one table in one action, how to avoid some tables updated but the others didn’t?
For example, when tourists book a tour. Their funds should be reduced. Booking should be generated. And the available seats for a particular tour should decrease. But what happens if the funds of tourists are reduced, but no booking? You will receive complaints from the tourists!
