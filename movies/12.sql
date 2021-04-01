/*
In 12.sql, write a SQL query to list the titles of all movies
in which both Johnny Depp and Helena Bonham Carter starred.
Your query should output a table with a single column for the title of each movie.
You may assume that there is only one person in the database with the name Johnny Depp.
You may assume that there is only one person in the database with the name Helena Bonham Carter.

Executing 12.sql results in a table with 1 column and 6 rows.

-- https://www.w3schools.com/sql/sql_ref_keywords.asp
*/

--.schema
/*
SELECT title
FROM movies
JOIN stars ON stars.movie_id = movies.id
JOIN people ON people.id = stars.person_id
WHERE name = "Johnny Depp"
LIMIT 5;
-- have to work backwards to join title to people names columns
*/
SELECT title
FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = "Johnny Depp"
INTERSECT
SELECT title
FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE people.name = "Helena Bonham Carter";