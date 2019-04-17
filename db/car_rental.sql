DROP TABLE rentals;
DROP TABLE  vehicles;
DROP TABLE ccustomers;


CREATE TABLE vehicles (
  id SERIAL PRIMARY KEY,
  make VARCHAR(255),
  model VARCHAR(255),
  colour VARCHAR(255),
  seat_capacity INT4,
  fuel_type VARCHAR(255),
  daily_price INT,
  available_stock INT
);

CREATE TABLE ccustomers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  country VARCHAR(255),
  city VARCHAR(255),
  age INT
);

CREATE TABLE rentals (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES ccustomers(id) ON DELETE CASCADE,
  vehicle_id INT REFERENCES vehicles(id) ON DELETE CASCADE
);
