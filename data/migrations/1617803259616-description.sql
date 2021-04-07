--Query 1: This SQLquery to create second table named (authors) with `id` and `name` columns --
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));


--Query 2: This SQLquery to insert in the new tabel under coulmn `name` distinct (unique) values from old tabel (books) column `author` --
INSERT INTO authors(name) SELECT DISTINCT author FROM books;


--Query 3: This SQLquery is to make changing to the first table (books) by adding new coulmn with the name `author_id` and INTEGER data type.  --
ALTER TABLE books ADD COLUMN author_id INT;


-- Query 4: This SQLquery to edit first tabel (books) by setting the column `author_id` with the same values of the coulmn `id` from the second tabel (authors), with condition of adding that ids based on the unique names in the second tabel (authors) --
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;


-- Query 5: This SQLquery to make changing to the the first tabel (books) by dropping (deleting) column `author`, because we don't need these names to show in the (books) table but only in the new (authors) table. --
ALTER TABLE books DROP COLUMN author;


-- Query 6: This SQLquery to make changing to the first table (books) by making the column `author_id` as a FOREIGN KEY under name of `fk_authors` and with referancing to the primary key in the new tabel (authors) column `id` --
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);

