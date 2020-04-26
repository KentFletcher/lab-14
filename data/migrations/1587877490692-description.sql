CREATE DATABASE lab14_normal WITH TEMPLATE lab14;
    -- This creates a new database with the same data as the lab14 database

--Query 1
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
    --  This adds a new table to the new db called bookshelves

--Query 2
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
    --  This selects all the unique values from the bookshelf row in books table and insert them into the bookshelves table, in the name column.

--Query 3
ALTER TABLE books ADD COLUMN bookshelf_id INT;
    -- This adds a column called bookshelf_id to the books table and gives it an integer value

--Query 4
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
    -- This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. 
    --The subquery finds the bookshelf row that has a name matching the current book’s bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.

--Query 5
ALTER TABLE books DROP COLUMN bookshelf;
    -- This will drop the column bookshelf from the books table, because it no longer needs the string to represent each bookshelf.

--Query 6
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
    -- This modifies the data type of bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table.  It lets psql know how the 2 tables are connected.

