/*
In 11.sql, write a SQL query to list the titles of the five highest rated
movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
Your query should output a table with a single column for the title of each movie.
You may assume that there is only one person in the database with the name
Chadwick Boseman.

Executing 11.sql results in a table with 1 column and 5 rows.

-- https://www.w3schools.com/sql/sql_ref_keywords.asp
*/

--.schema

/* "TOP" doesnt work, in MySQL?
SELECT TOP 5 rating
FROM ratings
JOIN stars ON stars.movie_id = ratings.movie_id
JOIN people ON people.id = stars.person_id
WHERE name = "Chadwick Boseman"
LIMIT 5;
*/

SELECT title
FROM movies
JOIN ratings ON ratings.movie_id = movies.id
JOIN stars ON stars.movie_id = ratings.movie_id
JOIN people ON people.id = stars.person_id
WHERE name = "Chadwick Boseman"
ORDER BY rating DESC
LIMIT 5;

/*
SELECT title
FROM movies
JOIN stars ON stars.movie_id = movies.id
JOIN people ON people.id = stars.person_id
WHERE name = "Chadwick Boseman"
LIMIT 5;

SELECT rating
FROM ratings
JOIN stars ON stars.movie_id = ratings.movie_id
JOIN people ON people.id = stars.person_id
WHERE name = "Chadwick Boseman"
ORDER BY rating DESC
LIMIT 5;
*/