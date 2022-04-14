CREATE DATABASE eproperties; 
USE eproperties;

CREATE TABLE evaluators (
	evaluator_id int not null primary key,
    f_name varchar(30) not null,
    l_name varchar(30) not null,
    sex varchar(6),
    age int,
    street varchar(40),
    str_num int,
    city varchar(40),
    zip varchar(10)
);

CREATE TABLE region (
	region_id int not null primary key,
    r_name varchar(30) not null,
    population int,
    avg_income decimal(8, 2)
);

CREATE TABLE properties (
	property_id int not null primary key,
    street varchar(40),
    str_num int,
    city varchar(40),
    zip varchar(10),
    p_floor int,
    size decimal(6, 2),
    constr_year year,
    region_id int not null,
    is_office bool not null,
    is_residential bool not null,
    FOREIGN KEY (region_id)
		REFERENCES region(region_id)
);

CREATE TABLE office (
	property_id int not null primary key,
    tax_id varchar(9),
    FOREIGN KEY (property_id)
		REFERENCES properties(property_id)
);


CREATE TABLE residential (
	property_id int not null primary key,
    id_num varchar(8),
    FOREIGN KEY (property_id)
		REFERENCES properties(property_id)
);

CREATE TABLE evaluations (
	evaluation_id int not null primary key,
    evaluator_id int not null,
    property_id int not null,
    price decimal(10, 2),
    eval_day int,
    CONSTRAINT chk_eval_day CHECK (eval_day BETWEEN 1 and 31),
    eval_month int,
    CONSTRAINT chk_eval_month CHECK (eval_month BETWEEN 1 and 12),
    eval_year year,
    FOREIGN KEY (evaluator_id) 
		REFERENCES evaluators(evaluator_id),
	FOREIGN KEY (property_id) 
		REFERENCES properties(property_id)
);
# Inserting data manually into evaluators table
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10010, "Ioannis", "Triantafyllakis", "Male", 24, "Karystou", 20, "Athens", 11523);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10011, "Nikolaos", "Tsekas", "Male", 26, "Nikaias", 55, "Pireaus", 13033);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10012, "Georgia", "Konstantinou", "Female", 29, "Portarias", 10, "Athens", 11524);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10013, "Georgios", "Syrigos", "Male", 24, "Kifisias", 134, "Athens", 15443);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10014, "Maria", "Tsaldari", "Female", 27, "Panormou", 65, "Athens", 11525);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10015, "Ioanna", "Konstantaki", "Female", 26, "Artas", 2, "Athens", 11523);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10016, "Ioannis", "Karakostas", "Male", 30, "Leoforos Peiraios", 31, "Pireaus", 15022);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10017, "Vasileios", "Nikolakopoulos", "Male", 31, "Amalias", 2, "Athens", 12303);
INSERT INTO `evaluators`(evaluator_id, f_name, l_name, sex, age, street, str_num, city, zip) 
VALUES(10018, "Giorgos", "Nikolopoulos", "Male", 43, "Artas", 32, "Athens", 12209);

    
# Inserting data manually into region table
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00001, "Ambelokhpoi", 255000, 9500);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00002, "Halandri", 45000, 18000);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00003, "Kolonaki", 67000, 32000);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00004, "Exarcheia", 110000, 8500);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00005, "Nomismatokopeio", 97000, 10500);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00006, "Syntagma", 30000, 16400);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00007, "Marousi", 91000, 23100);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00008, "Peristeri", 305000, 10800);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00009, "Nea Smyrni", 125000, 14000);
INSERT INTO `region`(region_id, r_name, population, avg_income) 
VALUES(00010, "Glyfada", 90000, 23000);

# Inserting data manually into properties table
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10001, "Panormou", 77, "Athens", 11524, 2, 78.0, 1996, 00001, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10002, "Panormou", 34, "Athens", 11524, 6, 64.0, 1999, 00001, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10003, "Leoforos Poseidonos", 232, "Athens", 12245, 1, 122.5, 2006, 00010, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10004, "Ethnikis Antistaseos", 4, "Athens", 13322, 4, 97.0, 2010, 00002, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10005, "Plateia Halandriou", 1, "Athens", 13322, 3, 145.0, 2017, 00002, True, False);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10006, "Voutira", 6, "Athens", 15434, 7, 112.0, 1989, 00009, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10007, "Lenorman", 23, "Athens", 17620, 4, 65.0, 1997, 00008, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10008, "Leoforos Kifisias", 234, "Athens", 17721, 5, 210.0, 2019, 00007, True, False);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10009, "Leoforos Kifisias", 201, "Athens", 17724, 3, 112.5, 2014, 00007, True, False);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10010, "Mhtropoloeos", 45, "Athens", 11124, 7, 137.5, 1985, 00006, True, False);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10011, "Ermou", 1, "Athens", 17554, 5, 155.0, 2001, 00006, True, False);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10012, "Leoforos Kifisias", 78, "Athens", 11129, 1, 164.5, 2009, 00005, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10013, "Plateia Exarcehion", 1, "Athens", 23754, 2, 87.0, 1992, 00004, False, True);
INSERT INTO `properties`(property_id, street, str_num, city, zip, p_floor, size, constr_year, region_id, is_office, is_residential) 
VALUES(10014, "Patriarchou Ioakeim", 3, "Athens", 16129, 5, 200.5, 2007, 00003, False, True);

# Inserting data manually into office table
INSERT INTO `office`(property_id, tax_id) 
VALUES(10005, 168798532);
INSERT INTO `office`(property_id, tax_id) 
VALUES(10008, 558328511);
INSERT INTO `office`(property_id, tax_id) 
VALUES(10009, 541798580);
INSERT INTO `office`(property_id, tax_id) 
VALUES(10010, 199732731);
INSERT INTO `office`(property_id, tax_id) 
VALUES(10011, 236712366);

# Inserting data manually into residential table
INSERT INTO `residential`(property_id, id_num) 
VALUES(10001, "AM987654");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10002, "AE966656");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10003, "AT690612");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10004, "AA117656");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10006, "AM555451");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10007, "AR944454");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10012, "AA456723");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10013, "AY982431");
INSERT INTO `residential`(property_id, id_num) 
VALUES(10014, "AC445589");

# Inserting data manually into evaluations table
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110001, 10010, 10001, 84000, 22, 01, 2018);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110002, 10010, 10002, 76500, 12, 05, 2019);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110003, 10010, 10005, 112500, 03, 03, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110004, 10011, 10003, 99000, 02, 09, 2018);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110005, 10011, 10004, 103000, 15, 10, 2019);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110006, 10011, 10006, 189000, 10, 10, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110007, 10012, 10007, 112000, 02, 07, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110008, 10012, 10008, 46000, 28, 11, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110009, 10013, 10009, 198000, 01, 04, 2021);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110010, 10014, 10010, 300000, 12, 07, 2021);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110011, 10015, 10011, 212800, 16, 10, 2017);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110012, 10016, 10012, 203200, 03, 04, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110013, 10017, 10013, 114000, 02, 12, 2019);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110014, 10017, 10014, 69000, 07, 12, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year)
VALUES(110015, 10014, 10014, 60000, 30, 12, 2020);
INSERT INTO `evaluations`(evaluation_id, evaluator_id, property_id, price, eval_day, eval_month, eval_year) 
VALUES(110016, 10011, 10012, 210000, 23, 09, 2020);

# a.

SELECT property_id, street, str_num, city, zip
FROM properties
WHERE region_id IN (SELECT region_id 
                    FROM region 
                    WHERE avg_income > 40000
                    )
AND property_id IN (SELECT property_id 
                    FROM evaluations 
                    WHERE eval_day BETWEEN 24 AND 31
					AND eval_month = 12
					AND eval_year = 2020
	                );
				
# b.
###
SELECT
y.evaluator_id,
count(f.evaluation_id) AS No_of_evals_in_2020
FROM (
SELECT evaluator_id, evaluation_id, eval_year
FROM
	(
	SELECT x.evaluator_id, x.evaluation_id, x.eval_year
	FROM
		(
		SELECT A.evaluator_id, B.evaluation_id, B.eval_year
		FROM evaluators AS A
		LEFT JOIN evaluations AS B
		ON A.evaluator_id = B.evaluator_id
		) AS x
	LEFT JOIN evaluations AS e
    ON e.evaluation_id = x.evaluation_id
    ) AS w
WHERE eval_year = 2020
) AS f
RIGHT JOIN evaluators AS y
ON y.evaluator_id = f.evaluator_id
GROUP BY y.evaluator_id;


# c.

SELECT property_id
FROM evaluations
WHERE eval_year = 2020
GROUP BY property_id
HAVING count(evaluation_id) > 2;

# d.
SELECT evaluation_id
FROM evaluations
WHERE property_id IN (SELECT property_id
                      FROM properties
                      WHERE region_id IN (SELECT region_id 
					                      FROM region 
                                          WHERE avg_income > 25000
                                          )
                      );                    
#GROUP BY property_id;

# e.

SELECT count(evaluation_id) AS No_of_evaluations
FROM evaluations
WHERE property_id IN (SELECT property_id
                      FROM properties
                      WHERE region_id IN (SELECT region_id
                                          FROM region
                                          WHERE population > 50000
                                          )
                      )
AND eval_year = 2020;

# f.

SELECT region_id, round(avg(price / size), 2) AS region_avg_price_to_sqm_ratio
FROM (
      SELECT B.evaluation_id, A.region_id, A.size, B.price
	  FROM properties AS A
      JOIN evaluations AS B
      ON A.property_id = B.property_id
      ) AS t
GROUP BY region_id
ORDER BY region_avg_price_to_sqm_ratio ASC;

# g.

SELECT
y.evaluator_id,
sum(ifnull(f.is_office, 0)) AS office_evals,
sum(ifnull(f.is_residential, 0)) AS residential_evals
FROM (

SELECT evaluator_id, is_office, is_residential, eval_year
FROM
	(
	SELECT x.evaluator_id, x.evaluation_id, x.property_id, x.eval_year, p.is_office, p.is_residential
	FROM
		(
		SELECT A.evaluator_id, B.evaluation_id, B.property_id, B.eval_year
		FROM evaluators AS A
		LEFT JOIN evaluations AS B
		ON A.evaluator_id = B.evaluator_id
		) AS x
	LEFT JOIN properties AS p
	ON p.property_id = x.property_id
	) AS w
WHERE eval_year = 2020

) AS f
RIGHT JOIN evaluators AS y
ON y.evaluator_id = f.evaluator_id

GROUP BY y.evaluator_id;


# h.

SELECT 
region_id, 
round((region_avg_price_to_sqm_ratio_20/region_avg_price_to_sqm_ratio_19 - 1)*100, 2) AS rate_of_change_19_to_20
FROM
(
SELECT reg.region_id, 
ifnull(tab1.region_avg_price_to_sqm_ratio_19, 0) AS region_avg_price_to_sqm_ratio_19, 
ifnull(tab2.region_avg_price_to_sqm_ratio_20, 0) AS region_avg_price_to_sqm_ratio_20
FROM region AS reg
LEFT JOIN (
			SELECT region_id, round(avg(price / size), 2) AS region_avg_price_to_sqm_ratio_19
			FROM (
				SELECT A.region_id, B.evaluation_id, B.eval_year, A.size, B.price
				FROM properties AS A
				JOIN evaluations AS B
				ON A.property_id = B.property_id
				) AS t
			WHERE eval_year = 2019
			GROUP BY region_id 
			) AS tab1 
ON reg.region_id = tab1.region_id

LEFT JOIN (
			SELECT region_id, round(avg(price / size), 2) AS region_avg_price_to_sqm_ratio_20
			FROM (
				SELECT A.region_id, B.evaluation_id, B.eval_year, A.size, B.price
				FROM properties AS A
				JOIN evaluations AS B
				ON A.property_id = B.property_id
				) AS t
			WHERE eval_year = 2020
			GROUP BY region_id
			) AS tab2
ON reg.region_id = tab2.region_id
)AS tab3;

# i.

SELECT r.region_id, 
(x.region_evals_of_20/x.total_evals_of_20)*100 AS region_evals_20_to_total_evals_20, 
(r.population/(SELECT sum(population) FROM region))*100 AS region_pop_to_total_pop
FROM region AS r
LEFT JOIN 
	(
	SELECT 
    B.region_id, 
	(SELECT count(*) FROM evaluations WHERE eval_year = 2020) AS total_evals_of_20, 
	count(A.evaluation_id) AS region_evals_of_20
	FROM evaluations AS A
	JOIN properties AS B
	ON A.property_id = B.property_id 
	WHERE A.eval_year = 2020
    GROUP BY region_id
	) AS x
ON r.region_id = x.region_id
GROUP BY r.region_id;


