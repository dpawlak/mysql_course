-- Print the number of books in the database
SELECT COUNT(*) FROM books;

-- Print out how many books were released in each year
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- Print out the total number of books in stock
SELECT SUM(stock_quantity) FROM books;

-- Find the average released_year for each author
SELECT author_fname, author_lname, AVG(released_year) FROM books
GROUP BY author_lname, author_fname;

-- Find the fullname of the author who wrote the longest book
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book' 
FROM books
ORDER BY pages desc;

-- Find the  number of books and avg pages by year
SELECT released_year AS 'year',
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books
    GROUP BY released_year;