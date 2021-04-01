/*
In 6.sql, write a SQL query to determine the average rating of all movies released in 2012.
Your query should output a table with a single column and a single row (plus optional header) containing the average rating.

Executing 6.sql results in a table with 1 column and 1 row.
*/

--SELECT * FROM shows
--JOIN genres ON show.id = genres.show_id;
-- to join two tables by matching IDs in columns we specify.

-- JOIN sub-table with the lookup info you want ON sub-table.header = table.header (with headers matching) WHERE lookup is in sub-table

SELECT avg(rating)
FROM ratings
JOIN movies ON movies.id = ratings.movie_id
WHERE year = 2012;