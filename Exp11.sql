EXPERIMENT 11

Aim

To perform database operations using Cassandra.

Program

-- Create a keyspace
CREATE KEYSPACE library
WITH REPLICATION = {
    'class': 'SimpleStrategy',
    'replication_factor': 3
};

-- Select the library keyspace
USE library;

-- Create authors table
CREATE TABLE authors (
    AuthorID int PRIMARY KEY,
    FirstName text,
    LastName text
);

-- Insert author records
INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (2, 'Aldous', 'Huxley');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (3, 'J.K.', 'Rowling');

-- Display all authors
SELECT * FROM authors;

-- Update author details
UPDATE authors
SET LastName = 'Smith'
WHERE AuthorID = 1;

-- Display the updated author
SELECT * FROM authors
WHERE AuthorID = 1;

-- Delete an author
DELETE FROM authors
WHERE AuthorID = 1;

-- Display the deleted author's record
SELECT * FROM authors
WHERE AuthorID = 1;

Output

1. After inserting records:

AuthorID| FirstName| LastName
1| George| Orwell
2| Aldous| Huxley
3| J.K.| Rowling

2. After updating AuthorID = 1:

AuthorID| FirstName| LastName
1| George| Smith

3. After deleting AuthorID = 1:

(Empty result set)

Result

Thus, keyspace creation, table creation, insertion, selection, updating, and deletion operations were performed using Cassandra.
