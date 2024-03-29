# use practice_db;

#
#
#
# The CITY table is described as follows:
DROP TABLE IF EXISTS city;

CREATE TABLE city
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(17),
    countrycode VARCHAR(3),
    district    VARCHAR(20),
    population  INT,
    PRIMARY KEY (id)
);

INSERT INTO city (name, countrycode, district, population)
VALUES ('Atlanta', 'USA', 'Georgia', 200000),
       ('Miami', 'USA', 'Florida', 20),
       ('Tokyo', 'JPN', 'Tokyo', 3000000);

# Query all columns for all American cities in the CITY table with populations larger than 100000.
# The CountryCode for America is USA.
SELECT *
from city
where countrycode = 'USA'
  and population > 100000;


# Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT name
from city
where countrycode = 'USA'
  and population > 120000;

# Query all columns (attributes) for every row in the CITY table
SELECT *
from city;

# Query all columns for a city in CITY with the ID 1661.
SELECT *
from city
where id = 1661;

# Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT *
from city
where countrycode = 'JPN';

# Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT name
from city
where countrycode = 'JPN';

#
#
#
# The STATION table is described as follows:
DROP TABLE IF EXISTS station;

CREATE TABLE station
(
    id     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    city   VARCHAR(21),
    state  VARCHAR(2),
    lat_n  INT,
    long_w INT,
    PRIMARY KEY (id)
);

INSERT INTO station (city, state, lat_n, long_w)
VALUES ('Macon', 'GA', 21, 45),
       ('San Antonio', 'TX', 34, 78);

# Query a list of CITY and STATE from the STATION table.
SELECT city, state
from station;

# Query a list of CITY names from STATION for cities that have an even ID number.
# Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT city
from station
where id % 2 = 0;

# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(city) - COUNT(DISTINCT city)
FROM STATION;

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
# If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT city, length(city)
from station
order by length(city), city
limit 1;
select city, length(city)
from station
order by length(city) desc
limit 1;

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT city
from station
WHERE city REGEXP '^[aeiou]';

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT city
from station
WHERE city REGEXP '[aeiou]$';

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city
from station
WHERE city REGEXP '[aeiou]$'
  and city REGEXP '^[aeiou]';

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM STATION
WHERE city NOT IN (SELECT city FROM STATION WHERE city REGEXP '^[aeiou]');

# Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM STATION
WHERE city NOT IN (SELECT city from station WHERE city REGEXP '[aeiou]$');

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM STATION
WHERE city NOT IN (SELECT city FROM STATION WHERE city REGEXP '^[aeiou]')
   or city NOT IN (SELECT city from station WHERE city REGEXP '[aeiou]$');

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM STATION
WHERE city NOT IN (SELECT city FROM STATION WHERE city REGEXP '^[aeiou]')
  and city NOT IN (SELECT city from station WHERE city REGEXP '[aeiou]$');


#
#
#
# The STUDENTS table is described as follows:
DROP TABLE IF EXISTS students;

CREATE TABLE students
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name  VARCHAR(100),
    marks INT,
    PRIMARY KEY (id)
);

INSERT INTO students (name, marks)
VALUES ('Mark', 30),
       ('Tom', 45),
       ('Sarah', 2);

# Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name.
# If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT name
from students
where marks > 75
ORDER BY RIGHT(Name, 3), Id;

#
#
#
# The EMPLOYEE table is described as follows:
DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    employee_id INT          NOT NULL,
    name        VARCHAR(50),
    months      INT          NOT NULL,
    salary      INT          NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO employee (employee_id, name, months, salary)
VALUES (213, 'Tom', 32, 45000),
       (456, 'Rick', 65, 78000),
       (678, 'Jessica', 3, 40000);

# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
from employee
ORDER BY name;

# Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month
# who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT name
from employee
where salary > 2000
  and months < 10
ORDER BY employee_id;



# P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
#       *
#       * *
#       * * *
#       * * * *
#       * * * * *
# Write a query to print the pattern P(20).

SET @row := 0;
SELECT REPEAT('* ', @row := @row + 1)
FROM information_schema.TABLES
WHERE @row < 20;



#
#
#
# The COUNTRY table is as follows:
DROP TABLE IF EXISTS country;

CREATE TABLE country
(
    id             INT UNSIGNED NOT NULL AUTO_INCREMENT,
    code           VARCHAR(3),
    name           VARCHAR(44),
    continent      VARCHAR(13),
    region         VARCHAR(25),
    surfacearea    INT,
    indepyear      VARCHAR(5),
    population     INT,
    lifeexpectancy VARCHAR(4),
    gnp            INT,
    gnpold         VARCHAR(9),
    localname      VARCHAR(44),
    governmentform VARCHAR(44),
    headofstate    VARCHAR(32),
    capital        VARCHAR(4),
    code2          VARCHAR(2),
    PRIMARY KEY (id)
);

INSERT INTO country (code, name, continent, region, surfacearea, indepyear, population, lifeexpectancy, gnp, gnpold,
                     localname,
                     governmentform, headofstate, capital, code2)
VALUES ('321', 'vefvf', 'fref', 'bvefbv', 4235, '1800', 432423,
        '34', 3421432, '32442', 'vrevgre', 'wefqrvreqvr', 'frewvrwe', 'few', 'we'),
       ('567', 'gtrbrt', 'gtrgt', 'getrge', 4354, '3452', 2454334, '56', 5432,
        '543543', 'grewgr', 'grewgwre', 'hythyt', 'hyth', 'hy');

# Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT SUM(city.population)
FROM city
         INNER JOIN country ON city.countrycode = CODE
WHERE CONTINENT = 'ASIA';

#Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT c.name
FROM city c
         LEFT JOIN country co ON c.countrycode = co.CODE
WHERE co.CONTINENT = 'Africa';

# Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent)
# and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT country.continent, FLOOR(avg(city.population))
FROM country
         JOIN city ON city.countrycode = country.code
GROUP BY country.continent;

#
#
#
# The STUDENTS, GRADES tables are as follows:

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS grades;

CREATE TABLE students
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name  VARCHAR(50),
    marks INT,
    PRIMARY KEY (id)
);

CREATE TABLE grades
(
    grade INT,
    min   INT,
    max   INT
);

INSERT INTO students (name, marks)
VALUES ('Tony', 88),
       ('Steve', 23),
       ('Dave', 47);

INSERT INTO grades (grade, min, max)
VALUES (1, 0, 9),
       (2, 10, 19),
       (3, 20, 29),
       (4, 30, 39),
       (5, 40, 49),
       (6, 50, 59),
       (7, 60, 69),
       (8, 70, 79),
       (9, 80, 89),
       (10, 90, 100);

# Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark.
# Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- higher grades are entered first.
# If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically.
# Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order.
# If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
SELECT IF(grade < 8, NULL, name), grade, marks
FROM students,
     grades
WHERE marks BETWEEN min AND max
ORDER BY grade DESC, name ASC;

#
#
# NO TABLES CREATED FOR THIS PROBLEM
/*
Enter your query here.
*/
# SELECT R.HACKER_ID, R.NAME
# FROM SUBMISSIONS S
#          INNER JOIN HACKERS R ON R.HACKER_ID = S.HACKER_ID
#          INNER JOIN CHALLENGES C ON C.CHALLENGE_ID = S.CHALLENGE_ID
#          INNER JOIN DIFFICULTY D ON D.DIFFICULTY_LEVEL = C.DIFFICULTY_LEVEL
# GROUP BY R.HACKER_ID, R.NAME
# HAVING SUM(IF(S.SCORE = D.SCORE, 1, 0)) > 1
# ORDER BY SUM(IF(S.SCORE = D.SCORE, 1, 0)) DESC, R.HACKER_ID;
