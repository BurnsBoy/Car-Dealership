CREATE TABLE salesperson (
  salesperson_id SERIAL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY (salesperson_id)
);

CREATE TABLE customer (
  customer_id SERIAL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY (customer_id),
);

CREATE TABLE mechanic (
  mechanic_id SERIAL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY (mechanic_id)
);

CREATE TABLE car_part (
  part_id SERIAL,
  part_name VARCHAR(100),
  price NUMERIC(10,2),
  PRIMARY KEY (part_id)
);

CREATE TABLE car (
  car_id SERIAL,
  customer_id INTEGER not null,
  Make VARCHAR(100),
  Model VARCHAR(100),
  Year NUMERIC(4,0),
  PRIMARY KEY (car_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
  
);

CREATE TABLE invoice (
  invoice_id SERIAL,
  salesperson_id INTEGER not null,
  customer_id INTEGER not null,
  car_id INTEGER not null,
  price NUMERIC(10,2),
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE service_ticket (
  ticket_id SERIAL,
  mechanic_id INTEGER not null,
  customer_id INTEGER not null,
  part_id INTEGER,
  car_id INTEGER not null,
  labor_cost NUMERIC(10,2),
  total_cost NUMERIC(10,2),
  PRIMARY KEY (ticket_id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (part_id) REFERENCES part(part_id),
  FOREIGN KEY (car_id) REFERENCES car(car_id)
);