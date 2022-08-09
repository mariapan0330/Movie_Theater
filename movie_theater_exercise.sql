-- customer
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	age INTEGER,
	rewards_member BOOLEAN
);

INSERT INTO customer (first_name, last_name, age, rewards_member)
VALUES ('Mickey', 'Mouse', 93, true);

INSERT INTO customer (first_name, last_name, age, rewards_member)
VALUES ('Tyrannosaurus', 'Rex', 67000000, false);

INSERT INTO customer (first_name, last_name, age, rewards_member)
VALUES ('Indiana', 'Jones', 37, false);

SELECT * FROM customer;



-- Ticket
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	theater_id INTEGER NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

ALTER TABLE ticket
ADD COLUMN price INTEGER;

INSERT INTO ticket (customer_id, theater_id, movie_id)
VALUES (1,2,1), (1,2,2), (3,3,2), (4,4,3), (4,4,2);

-- forgot to add prices
UPDATE ticket
SET price = 8;

SELECT * FROM ticket;



-- theater
CREATE TABLE theater(
	theater SERIAL PRIMARY KEY,
	address VARCHAR(50),
	staff_id INTEGER NOT NULL,
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

ALTER TABLE theater
RENAME COLUMN theater TO theater_id;

INSERT INTO theater (address, staff_id)
VALUES ('Niles 12', 1), ('Niles 12', 2), ('Village Crossing 18', 3);

SELECT * FROM theater;



-- staff
CREATE TABLE staff(
	staff SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	staff_rank VARCHAR(20)
);

ALTER TABLE staff
RENAME COLUMN staff TO staff_id;

INSERT INTO staff (first_name, last_name, staff_rank)
VALUES ('Doctor','Strange','Crew Member'), ('Curious','George','Manager');

-- oops that's not a name, update:
UPDATE staff
SET first_name = 'Stephen'
WHERE first_name = 'Doctor';

INSERT INTO staff (first_name, last_name, staff_rank)
VALUES ('Barry','Allen','Crew Member');

SELECT * FROM staff;



-- movie
CREATE TABLE movie(
	movie SERIAL PRIMARY KEY,
	title VARCHAR(50),
	rating VARCHAR(10),
	description VARCHAR(200),
	warnings VARCHAR(50)
);

ALTER TABLE movie
RENAME COLUMN movie TO movie_id;

ALTER TABLE movie 
ADD COLUMN release_year INTEGER;

INSERT INTO movie (title, release_year, rating, description, warnings)
VALUES ('Witness for the Prosecution', 1957, 'Approved','A veteran British barrister must defend his client in a murder trial that has surprise after surprise.','none'),
('Parasite', 2019,'R','Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.','none'),
('Incredibles 2', 2018, 'PG','The Incredibles family takes on a new mission which involves a change in family roles: Bob Parr (Mr. Incredible) must manage the house while his wife Helen (Elastigirl) goes out to save the world.', 'Seizure Warning');


SELECT * FROM customer;
SELECT * FROM movie;
SELECT * FROM staff;
SELECT * FROM theater;
SELECT * FROM ticket;










