CREATE DATABASE empdata;
USE empdata;
CREATE TABLE personal(
	pid int NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    date_of_birth datetime NOT NULL,
    title varchar(255) NOT NULL,
    employee_type varchar(255) NOT NULL,
    position_id int,
    PRIMARY KEY(pid),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

ALTER TABLE personal
ADD arena varchar(255) NOT NUll;
ALTER TABLE personal
ADD is_deleted BOOL NOT NULL DEFAULT(0);
CREATE TABLE place(
	place_id int AUTO_INCREMENT,
    country_id int NOT NULL,
    place varchar(255) NOT NULL,
    PRIMARY KEY(place_id),
    FOREIGN KEY (country_id) references country(country_id)
);
INSERT INTO place (country_id, place)
VALUES (1,"Mumbai"),
(1,"Delhi"),
(1,"Pune"),
(2,"Chicago"),
(2,"New York"),
(2,"Los Angeles"),
(3,"Dubai"),
(3,"Abu Dhabi");

CREATE TABLE country(
	country_id int AUTO_INCREMENT,
    country varchar(255) NOT NULL,
    PRIMARY KEY(country_id)
);
INSERT INTO country (country)
VALUES ("India"),
("USA"),
("UAE");

ALTER TABLE country
ADD codes varchar(30) NOT NUll;
UPDATE empdata.country SET codes = '+91' WHERE (country_id = '1');
UPDATE empdata.country SET codes = '+1' WHERE (country_id = '2');
UPDATE empdata.country SET codes = '+971' WHERE (country_id = '3');

SELECT * FROM empdata.country;

CREATE TABLE empdata.positions(
	position_id int NOT NULL AUTO_INCREMENT,
    position_name varchar(255) NOT NULL,
    PRIMARY KEY (position_id)
);
INSERT INTO empdata.positions (position_name)
VALUES ("Senior Developer"),
("Junior Developer"),
("Team Lead"),
("Project Manager"),
("Manager"),
("Junior Employee"),
("Senior Employee"),
("Junior Advisor"),
("Senior Advisor"),
("Accountant");

CREATE TABLE skills(
	skill_id int AUTO_INCREMENT,
    skills varchar(255),
    PRIMARY KEY(skill_id)
);
INSERT INTO skills
VALUES (1, "C#"),
(2,"Java"),
(3,"JavaScript"),
(4,"My SQL"),
(5,"jQuery"),
(6,"HTML"),
(7,"CSS"),
(8,"Azure"),
(9,"Python"),
(10,"Spring & Spring Boot");

CREATE TABLE contact(
	cid int NOT NULL AUTO_INCREMENT,
    pid int NOT NULL,
    contact varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    PRIMARY KEY(cid),
    FOREIGN KEY (pid) REFERENCES personal(pid)
);
ALTER TABLE contact
ADD codes varchar(30) NOT NUll;

CREATE TABLE address(
	aid int NOT NULL AUTO_INCREMENT,
    pid int NOT NULL,
    street_name varchar(255) NOT NULL,
    zipcode varchar(255) NOT NULL,
    place_id int NOT NULL,
    country_id int NOT NULL,
    PRIMARY KEY(aid),
    FOREIGN KEY (pid) REFERENCES personal(pid),
    FOREIGN KEY (place_id) REFERENCES place(place_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
ALTER TABLE address
Drop codes;

CREATE TABLE skilldetail(
	skid int NOT NULL AUTO_INCREMENT,
    pid int NOT NULL,
    skill_id int NOT NULL,
    PRIMARY KEY(skid),
    FOREIGN KEY (pid) REFERENCES personal(pid),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)    
);
SELECT * FROM empdata.positions;
SHOW variables;

SELECT personal.*, positions.position_name, contact.contact, contact.email, contact.codes
FROM personal
LEFT JOIN positions ON personal.position_id = positions.position_id
LEFT JOIN contact ON personal.pid = contact.pid;

SELECT address.pid, address.street_name, address.zipcode, place.place, country.country
FROM address
LEFT JOIN place ON address.place_id = place.place_id
LEFT JOIN country ON address.country_id = country.country_id;

SELECT skilldetail.pid, skills.skills
FROM skilldetail
LEFT JOIN skills ON skilldetail.skill_id = skills.skill_id;

-- complete table
SELECT personal.*, positions.position_name, contact.contact, contact.email, contact.codes, address.street_name, address.zipcode, place.place, country.country, skills.skills
FROM personal
LEFT JOIN positions ON personal.position_id = positions.position_id
LEFT JOIN contact ON personal.pid = contact.pid
LEFT JOIN address ON personal.pid = address.pid
LEFT JOIN place ON address.place_id = place.place_id
LEFT JOIN country ON address.country_id = country.country_id
LEFT JOIN skilldetail ON personal.pid = skilldetail.pid
LEFT JOIN skills ON skilldetail.skill_id = skills.skill_id;

DELIMITER $$
CREATE PROCEDURE get_empdata()
BEGIN
	SELECT personal.*, positions.position_name, contact.*, address.street_name, address.zipcode, place.place, country.country, skills.skills, skills.skill_id, country.country_id
	FROM personal
	LEFT JOIN positions ON personal.position_id = positions.position_id
	JOIN contact ON personal.pid = contact.pid
	JOIN address ON personal.pid = address.pid
	JOIN place ON address.place_id = place.place_id
	JOIN country ON address.country_id = country.country_id
	JOIN skilldetail ON personal.pid = skilldetail.pid
	JOIN skills ON skilldetail.skill_id = skills.skill_id
    WHERE is_deleted = 0;
END $$
DELIMITER ;

CALL get_empdata();

SELECT personal.*, positions.position_name, contact.*, address.street_name, address.zipcode, place.place, country.country, country.country_id
	FROM personal
	LEFT JOIN positions ON personal.position_id = positions.position_id
	JOIN contact ON personal.pid = contact.pid
	JOIN address ON personal.pid = address.pid
	JOIN place ON address.place_id = place.place_id
	JOIN country ON address.country_id = country.country_id
    WHERE is_deleted = 0;
    
    SELECT personal.*, positions.position_name, contact.*, address.street_name, address.zipcode, place.place, country.country, skills.skills, skills.skill_id, country.country_id
	FROM personal
	LEFT JOIN positions ON personal.position_id = positions.position_id
	JOIN contact ON personal.pid = contact.pid
	JOIN address ON personal.pid = address.pid
	JOIN place ON address.place_id = place.place_id
	JOIN country ON address.country_id = country.country_id
	JOIN skilldetail ON personal.pid = skilldetail.pid
	JOIN skills ON skilldetail.skill_id = skills.skill_id
    WHERE is_deleted = 0;
    
SELECT personal.first_name, personal.last_name, personal.date_of_birth, personal.title, personal.employee_type, 
positions.position_name, contact.contact, contact.email, contact.codes, address.street_name, address.zipcode, place.place, country.country,
    GROUP_CONCAT(DISTINCT skills.skills) as skills
	FROM personal
	LEFT JOIN positions ON personal.position_id = positions.position_id
	JOIN contact ON personal.pid = contact.pid
	JOIN address ON personal.pid = address.pid
	JOIN place ON address.place_id = place.place_id
	JOIN country ON address.country_id = country.country_id
	JOIN skilldetail ON personal.pid = skilldetail.pid
	JOIN skills ON skilldetail.skill_id = skills.skill_id
    WHERE is_deleted = 0
    GROUP BY personal.pid, personal.position_id, contact.cid, address.street_name, address.zipcode, place.place, country.country;
    
UPDATE empdata.personal 
SET first_name = 'Govardhan', 
	last_name = 'ks', 
	date_of_birth = '2001-11-08T02:04', 
	title ='Back End Developer', 
	employee_type ='Employer,Advisor', 
	position_id = '4', 
	arena = 'will think about it' 
WHERE pid = '7';
UPDATE empdata.contact 
SET contact= '5874126589', 
	email= 'sdsd79@gmail.com', 
	codes = '+971' 
WHERE pid = '7';
UPDATE empdata.address 
SET street_name= 'Parrys street', 
	zipcode= '441912', 
    place_id = '7', 
    country_id = '3' 
WHERE pid = '7';

-- updating 3 table using single query
UPDATE empdata.personal p, empdata.contact c, empdata.address a
SET p.first_name = 'Govardhan', 
	p.last_name = 'Govi', 
	p.date_of_birth = '2001-11-08T02:04', 
	p.title ='Back End Developer', 
	p.employee_type ='Employer,Advisor', 
	p.position_id = '4', 
	p.arena = 'will think about!!!!',
    c.contact= '7708411025', 
	c.email= 'govi79@gmail.com', 
	c.codes = '+971',
    a.street_name= 'Parrys st', 
	a.zipcode= '441912', 
    a.place_id = '7', 
    a.country_id = '3'
WHERE p.pid = '7' AND c.pid = '7' AND a.pid = '7';

-- updating 3 tables using join
UPDATE empdata.personal p
INNER JOIN empdata.contact c ON c.pid = p.pid
INNER JOIN empdata.address a ON a.pid = p.pid
SET p.first_name = 'Chaynesh', 
	p.last_name = 'Rathore', 
	p.date_of_birth = '2001-11-08T02:04', 
	p.title ='Back End Developer', 
	p.employee_type ='Employer,Advisor', 
	p.position_id = '4', 
	p.arena = 'will think about it!!!!',
    c.contact= '7708411025', 
	c.email= 'chay79@gmail.com', 
	c.codes = '+971',
    a.street_name= 'Parrys st', 
	a.zipcode= '441912', 
    a.place_id = '7', 
    a.country_id = '3'
WHERE p.pid = '7';

-- update 3 table and delete 1 table detail and insert new values
UPDATE empdata.personal p
INNER JOIN empdata.contact c ON c.pid = p.pid
INNER JOIN empdata.address a ON a.pid = p.pid
SET p.first_name = 'Chaynesh', 
	p.last_name = 'Rathore', 
	p.date_of_birth = '2001-11-08T02:04', 
	p.title ='Back End Developer', 
	p.employee_type ='Employer,Advisor', 
	p.position_id = '4', 
	p.arena = 'will think about it!!!!',
    c.contact= '7708411025', 
	c.email= 'chay79@gmail.com', 
	c.codes = '+971',
    a.street_name= 'Parrys st', 
	a.zipcode= '441912', 
    a.place_id = '7', 
    a.country_id = '3'
WHERE p.pid = '7';