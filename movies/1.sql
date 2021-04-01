-- to execute the file type (inside terminal not inside sqlite3) : cat 1.sql | sqlite3 movies.db

-- .schema outputs the table columns in movies.db

-- sqlite3 movies.db

--SELECT title FROM movies WHERE person = (SELECT ...);

--SELECT title, xyz FROM movies WHERE person IN (SELECT ...); -- what is IN?

--SELECT col1, col2, FROM table1 ORDER BY col3 DESC; -- eg select 2019 movies order by name maybe. DESC is descending order

SELECT title FROM movies WHERE Year = 2008;
--SELECT title, COUNT(title) as n FROM movies WHERE year = 2008; -- gives total n rows -- or
--SELECT COUNT(*) FROM movies WHERE Year = 2008;