/*
In 4.sql, write a SQL query to determine the number of movies with an IMDb rating of 10.0.
Your query should output a table with a single column and a single row (plus optional header) containing the number of movies with a 10.0 rating.

Executing 4.sql results in a table with 1 column and 1 row.
*/
--.schema
--SELECT rating FROM ratings WHERE rating >= 10.0;
--select rating from ratings where rating = 10.0;
--select movie_id from ratings where rating = 10.0;
--select (select title from movies where movie_id) from ratings where rating = 10.0;
SELECT COUNT(*) FROM ratings WHERE rating = 10.0;