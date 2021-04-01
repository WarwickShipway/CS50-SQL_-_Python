/*
In 8.sql, write a SQL query to list the names of all people who starred in Toy Story.
Your query should output a table with a single column for the name of each person.
You may assume that there is only one movie in the database with the title Toy Story.

Executing 8.sql results in a table with 1 column and 4 rows.
*/

--SELECT * FROM shows
--JOIN genres ON show.id = genres.show_id;
-- to join two tables by matching IDs in columns we specify.

-- JOIN sub-table with the lookup info you want ON sub-table.header = table.header (with headers matching) WHERE lookup is in sub-table

/* get title back
SELECT title
FROM movies
--JOIN movies ON movies.id = stars.movie_id
WHERE title = "Toy Story";

-- get people ID back from joining stars with movies
SELECT person_id
FROM stars
JOIN movies ON movies.id = stars.movie_id
WHERE title = "Toy Story";
*/

SELECT name
FROM people
JOIN stars ON stars.person_id = people.id
JOIN movies ON movies.id = stars.movie_id
WHERE title = "Toy Story";