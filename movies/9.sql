/*
In 9.sql, write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
Your query should output a table with a single column for the name of each person.
People with the same birth year may be listed in any order.
No need to worry about people who have no birth year listed, so long as those who do have a birth year are listed in order.
If a person appeared in more than one movie in 2004, they should only appear in your results once.

Executing 9.sql results in a table with 1 column and 18,013 rows.

-- https://www.w3schools.com/sql/sql_ref_keywords.asp
-- https://www.w3schools.com/sql/sql_distinct.asp

*/

SELECT DISTINCT name
FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE year = 2004
ORDER BY birth;
--LIMIT 10;


/*
-- count, note * wont work as using DISTINCT
SELECT COUNT(DISTINCT name) as n
FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE year = 2004;
*/

--SELECT title, COUNT(title) as n FROM movies WHERE year = 2018 2019 2020 ORDER BY title;
--SELECT COUNT(*) FROM movies WHERE year >= 2018;