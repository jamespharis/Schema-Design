-- Add JOIN columns and tables as dipicted to ensure that:
	-- Each person can have any number of interests
	-- Each interest can have any number of people interested in it
	-- A Person must have one location
--SELECT * FROM location;
--SELECT * FROM person;
--SELECT * FROM person_interest;
--SELECT * FROM interest;

-----#5 POPULATE LOCATION -----
-- INSERT INTO location ("city", "state", "country") VALUES 
--	('Nashville', 'Tennessee', 'United States'), ('Memphis', 'Tennessee', 'United States'), 
--	('Phoenix', 'Arizona', 'United States'), ('Denver', 'Colorado', 'United States');

-----#6 POPULATE PERSON -----
-- INSERT INTO person ("firstName", "lastName", age, location_id) VALUES
-- 	('Chickie', 'Ourtic', '21', '1'), ('Hilton', 'O''Hanley', '37', '1'), ('Barbe', 'Purver', '50', '3'),
-- 	('Reeta', 'Sammons', '34', '2'), ('Abbott', 'Fisbburne', '49', '1'), ('Winnie', 'Whines', '19', '4'),
-- 	('Samantha', 'Leese', '35', '2'), ('Edouard', 'Lorimer', '29', '1'), ('Mattheus', 'Shaplin', '27', '3'),
-- 	('Donnell', 'Corney', '25', '3'), ('Wallis', 'Kauschke', '28', '3'), ('Melva', 'Lanham', '20', '2'),
-- 	('Amelina', 'McNirlan', '22', '4'), ('Courtney', 'Holley', '22', '1'), ('Sigismond', 'Vala', '21', '4'),
-- 	('Jacquelynn', 'Halfacre', '24', '2'), ('Alanna', 'Spino', '25', '3'), ('Isa', 'Slight', '32', '1'),
-- 	('Kakalina', 'Renne', '26', '3');

-----#7 POPULATE INTEREST -----
-- INSERT INTO interest (title) VALUES ('Programming'), ('Gaming'), ('Computers'), ('Music'), ('Movies'), ('Cooking'), ('Sports');

-----#8 POPULATE PERSON_INTEREST -----
-- INSERT INTO person_interest (person_id, interest_id) VALUES ('1','1'), ('1','2'), ('1','6'), ('2','1'), ('2','7'), ('2','4'), 
-- 	 ('3','1'), ('3','3'), ('3','4'), ('4','1'), ('4','2'), ('4','7'), ('5','6'), ('5','3'), ('5','4'),
-- 	 ('6','2'), ('6','7'), ('7','1'), ('7','3'), ('8','2'), ('8','4'), ('9','5'), ('9','6'), 
-- 	 ('10','7'), ('10','5'), ('11','1'), ('11','2'), ('11','5'), ('12','1'), ('12','4'), ('12','5'), 
-- 	 ('13','2'), ('13','3'), ('13','7'), ('14','2'), ('14','4'), ('14','6'), ('15','1'), ('15','5'), ('15','7'), 
-- 	 ('16','2'), ('16','3'), ('16','4'), ('17','1'), ('17','3'), ('17','5'), ('17','7'), ('18','2'), ('18','4'), ('18','6'), 
-- 	 ('19','1'), ('19','2'), ('19','3'), ('19','4'), ('19','5'), ('19','6'), ('19','7');
 
-----#9 UPDATE AGES -----
-- UPDATE person 
-- SET age = age + 1
-- WHERE "firstName" = 'Chickie' OR "firstName" = 'Winnie' OR "firstName" = 'Edouard' OR "firstName" = 'Courtney'
-- 	      OR "firstName" = 'Melva' OR "firstName" = 'Isa' OR "firstName" = 'Abbott' OR "firstName" = 'Reeta';

-----#10 DELETE ACCOUNTS ----- 
---- Hilton O'Hanley & Alanna Spino (don't forget to delete their interests from the Person_Interest Table)
---- SELECT * FROM person AS P JOIN person_interest AS PI ON P.id = PI.person_id WHERE P.id = 2 OR P.id = 17; -- TEST
-- DELETE FROM person_interest WHERE person_id=2;
-- DELETE FROM person WHERE id=2;
-- DELETE FROM person_interest WHERE person_id=17;
-- DELETE FROM person WHERE id=17;
---1 QUERY ATTEMPT--- DELETE FROM person AS P USING person_interest AS PI WHERE P.id = PI.person_id AND P.id = 2 OR P.id = 17; [did not work]

-----#11 GATHER INFORMATION WITH SELECT STATEMENTS -----
-- SELECT "firstName", "lastName" FROM person;
-- SELECT "firstName", "lastName", L.city, L.state FROM person AS P JOIN location AS L ON P.location_id= L.id where L.city = 'Nashville';
-- SELECT L.city, COUNT(L.city) FROM location AS L JOIN person AS P ON P.location_id= L.id GROUP BY L.city;
-- SELECT I.title, COUNT(I.title) FROM interest AS I JOIN person_interest AS PI ON PI.interest_id = I.id GROUP BY I.title;

-- SELECT "firstName", "lastName", L.city, L.state, I.title FROM person AS P
-- 	JOIN location AS L ON P.location_id= L.id
-- 	JOIN person_interest AS PI ON PI.person_id = P.id
-- 	JOIN interest AS I ON PI.interest_id = I.id 
-- 	WHERE I.id=1 AND L.city = 'Nashville';
	
--- BONUS --- Use GROUP BY with CASE to determine how many people there are in each of the following age ranges: 20-30, 30-40, 40-50 (columns: range & count)
-- SELECT COUNT(*), * FROM
-- (
-- 	SELECT CASE
-- 		WHEN AGE >= 20 and AGE <=30 THEN '20-30'
-- 		WHEN AGE >= 30 and AGE <=40 THEN '30-40'
-- 		WHEN AGE >= 40 and AGE <=50 THEN '40-50' 
-- 	END as Range
-- 	FROM Person
-- ) temp
-- GROUP BY Range
-- ORDER BY Range