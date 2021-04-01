/*
In 13.sql, write a SQL query to list the names of all people who starred
in a movie in which Kevin Bacon also starred.
Your query should output a table with a single column for the name of each person.
There may be multiple people named Kevin Bacon in the database.
Be sure to only select the Kevin Bacon born in 1958.
Kevin Bacon himself should not be included in the resulting list.

Executing 13.sql results in a table with 1 column and 176 rows.

-- https://www.w3schools.com/sql/sql_ref_keywords.asp
*/

.schema
/*
SELECT name
FROM people
JOIN stars ON stars.person_id = people.id
WHERE name != "Kevin Bacon"
AND movie_id IN
*/


SELECT DISTINCT name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE title IN(SELECT DISTINCT title FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE name = "Kevin Bacon" AND birth = 1958) AND name != "Kevin Bacon"
LIMIT 5;

/*
SELECT COUNT(DISTINCT name) as n
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE title IN(SELECT DISTINCT title FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE name = "Kevin Bacon" AND birth = 1958) AND name != "Kevin Bacon";
*/