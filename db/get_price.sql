DROP FUNCTION IF EXISTS get_price(tour_id INT);
CREATE OR REPLACE FUNCTION get_price(tour_id INT) RETURNS table(price INT)
as
$$
 SELECT price from tours where id = tour_id;
$$
LANGUAGE sql;
