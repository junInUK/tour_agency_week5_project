
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS tours;
DROP TABLE IF EXISTS tourists;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles(
  id SERIAL PRIMARY KEY,
  reg_number VARCHAR(255),
  brand VARCHAR(255),
  seats INT
);

CREATE TABLE tours (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  start_date DATE,
  days INT,
  price INT,
  pic_url VARCHAR(255),
  vehicle_id INT REFERENCES vehicles(id) ON DELETE CASCADE
);

CREATE TABLE tourists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  address VARCHAR(255),
  funds INT
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  tour_id INT REFERENCES tours(id) ON DELETE CASCADE,
  tourist_id INT REFERENCES tourists(id) ON DELETE CASCADE,
  booking_date DATE
);
