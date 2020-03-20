
DROP FUNCTION IF EXISTS Booking(tourist_id INT,tour_id INT,booking_date DATE);
CREATE FUNCTION Booking(tourist_id INT,tour_id INT,booking_date DATE) RETURNS integer AS $$
DECLARE
   booking_id integer;
begin
UPDATE tourists SET funds = funds - (select get_price(tour_id)) where id = tourist_id;
INSERT INTO bookings(tourist_id,tour_id,booking_date) values (tourist_id,tour_id,booking_date) returning id into booking_id;
return booking_id;
end;
$$
LANGUAGE plpgsql;
