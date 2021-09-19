--  Select all books written before 1980 (non-inclusive)
 SELECT title, released_year FROM books 
    WHERE released_year < 1980;

-- Select all books written by Eggers or Chabon
SELECT title, author_lname FROM books 
    WHERE author_lname='Eggers' || author_lname='Chabon';

-- Select all books written by Lahiri, published after 2000
SELECT title, author_lname, released_year FROM books
    WHERE author_lname='Lahiri'
    AND released_year > 2000;

-- Select all books with page counts between 100 & 200
SELECT title, pages FROM books
    WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or and 'S'
SELECT title, author_lname FROM books
    WHERE author_lname RLIKE '^[CS]';

-- Case statements
SELECT 
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

-- Case statements
SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;