SELECT MIN(released_year) 
FROM books;
 
SELECT MIN(released_year) FROM books;
 
SELECT MIN(pages) FROM books;
 
SELECT MAX(pages) 
FROM books;
 
SELECT MAX(released_year) 
FROM books;

-- Does not work because the newer versions of MySQL prevent this command
-- from being ran in default settings. Because the result of this returns the 
-- highest page count but the wrong book title that does not correspond. 
SELECT MAX(pages), title
FROM books;

-- Here is a solution that returns the book with the most pages and the correct title.
-- We need to use a subquery. Slow command because two queries are executed.
SELECT title, pages FROM books WHERE pages=(SELECT MAX(pages) FROM books);

-- This command returns the same result and it is faster since only one query is executed
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Using MIN and MAX with GROUP BY
-- Find the year when each author released their first book.
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname,
author_fname;

-- This command makes the first and last name appear in the same column
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;