create or replace procedure purchaseCar(
	id INTEGER,
	customer INTEGER,
	salesperson INTEGER,
	car INTEGER,
	car_price numeric(10,2),
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	car_year_ numeric(4,0)
)
as $MAIN$
begin 
	insert into car(
		car_id,
		customer_id,
		make,
		model,
		car_year
	) values(
		car,
		customer,
		car_make,
		car_model,
		car_year_
	);
	insert into invoice (
		invoice_id,
		salesperson_id,
		customer_id,
		car_id,
		price
	) values(
		id,
		customer,
		salesperson,
		car,
		car_price
	);
end;
$MAIN$
language plpgsql;

create or replace procedure serviceCar(
	id INTEGER,
	customer INTEGER,
	mechanic INTEGER,
	part INTEGER,
	car INTEGER,
	labor numeric(10,2)
)
as $MAIN$
begin 
	insert into service_ticket (
		ticket_id,
		customer_id,
		mechanic_id,
		part_id,
		car_id,
		labor_cost,
		total_cost
	) values(
		id,
		customer,
		mechanic,
		part,
		car,
		labor,
		labor + (select price from car_part where part_id = part)
	);
end;
$MAIN$
language plpgsql;

insert into customer(
	customer_id,
	first_name,
	last_name
) values(
	1,
	'Joe',
	'Schmo'
);

insert into customer(
	customer_id,
	first_name,
	last_name
) values(
	2,
	'Betsy',
	'Boo'
);

insert into salesperson (
	salesperson_id,
	first_name,
	last_name
) values(
	1,
	'Billy',
	'Bob'
);

insert into salesperson (
	salesperson_id,
	first_name,
	last_name
) values(
	2,
	'Chad',
	'Braddington'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values(
	1,
	'Jim',
	'Jibbson'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values(
	2,
	'Toby',
	'Tigersnake'
);

insert into car_part (
	part_id,
  	part_name,
  	price
) values (
	0,
	'No Parts Used',
	0.00
);

insert into car_part (
	part_id,
  	part_name,
  	price
) values (
	1,
	'Tire',
	59.99
);

insert into car_part (
	part_id,
  	part_name,
  	price
) values (
	2,
	'Battery',
	99.99
);

insert into car_part (
	part_id,
  	part_name,
  	price
) values (
	3,
	'Starter',
	105.99
);

--call purchasecar(:id, :customer, :salesperson, :car, :car_price, :car_make, :car_model, :car_year_) 
call purchaseCar(1, 1, 1, 1, 10000.00, 'Volkswagen', 'Jetta', 2016);

call purchaseCar(2, 2, 1, 2, 2000.00, 'Ford', 'Five Hundred', 2007);

--call servicecar(:id, :customer, :mechanic, :part, :car, :labor) 

call servicecar(1, 2, 2, 2, 2, 65.39);

call servicecar(2, 2, 2, 1, 2, 45.69);

call purchaseCar(3, 2, 2, 3, 25000.00, 'Chevy', 'Equinox', 2018);

call servicecar(3, 2, 1, 0, 3, 25.00);

call servicecar(4, 1, 2, 3, 1, 49.33);

call servicecar(5, 1, 1, 0, 1, 34.82);

call servicecar(6, 2, 1, 0, 2, 15.00);

select * from invoice;

select * from service_ticket;








