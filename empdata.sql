CREATE DATABASE empdata;

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

CREATE TABLE place(
	place_id int AUTO_INCREMENT,
    place varchar(255),
    PRIMARY KEY(place_id)
);

CREATE TABLE country(
	country_id int AUTO_INCREMENT,
    country varchar(255),
    PRIMARY KEY(country_id)
);
INSERT INTO country
VALUES (1, "India"),
(2,"USA"),
(3,"Russia"),
(4,"China"),
(5,"Pakistan"),
(6,"Bangladesh"),
(7,"Nepal"),
(8,"Sri Lanka"),
(9,"UAE"),
(10,"Australia");

CREATE TABLE positions(
	position_id int AUTO_INCREMENT,
    positions varchar(255),
    PRIMARY KEY(position_id)
);
INSERT INTO positions
VALUES (1, "Senior Developer"),
(2,"Junior Developer"),
(3,"Team Lead"),
(4,"Project Manager"),
(5,"Manager"),
(6,"Junior Employee"),
(7,"Senior Employee"),
(8,"Junior Advisor"),
(9,"Senior Advisor"),
(10,"Accountant");

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

CREATE TABLE skilldetail(
	skid int NOT NULL AUTO_INCREMENT,
    pid int NOT NULL,
    skill_id int NOT NULL,
    PRIMARY KEY(skid),
    FOREIGN KEY (pid) REFERENCES personal(pid),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)    
);
