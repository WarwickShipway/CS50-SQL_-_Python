/*
In 10.sql, write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
Your query should output a table with a single column for the name of each person.

Executing 10.sql results in a table with 1 column and 1,841 rows.

-- https://www.w3schools.com/sql/sql_ref_keywords.asp
*/

--.schema

SELECT DISTINCT name
FROM people
JOIN directors ON directors.person_id = people.id
JOIN ratings ON ratings.movie_id = directors.movie_id
WHERE rating >= 9.0;
--LIMIT 10;

/*
SELECT COUNT(DISTINCT name) as n
FROM people
JOIN directors ON directors.person_id = people.id
JOIN ratings ON ratings.movie_id = directors.movie_id
WHERE rating >= 9.0;
*/