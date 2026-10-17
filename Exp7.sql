

-- 1. Create Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50)
);

-- Insert Authors
INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell');

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (2, 'Aldous', 'Huxley');

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (3, 'J.K.', 'Rowling');

-- Display Authors
SELECT * FROM Authors;


-- 2. Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR2(100),
    Genre VARCHAR2(50),
    PublicationYear INT
);

-- Insert Books
INSERT INTO Books (BookID, Title, Genre, PublicationYear)
VALUES (1, '1984', 'Dystopian', 1949);

INSERT INTO Books (BookID, Title, Genre, PublicationYear)
VALUES (2, 'Brave New World', 'Dystopian', 1932);

INSERT INTO Books (BookID, Title, Genre, PublicationYear)
VALUES (3, 'Harry Potter and the Sorcerers Stone',
        'Fantasy', 1997);

-- Display Books
SELECT * FROM Books;


-- 3. Create BookAuthors Table
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert Book-Author Details
INSERT INTO BookAuthors (BookID, AuthorID)
VALUES (1, 1);

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES (2, 2);

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES (3, 3);

-- Display BookAuthors
SELECT * FROM BookAuthors;


-- 4. Create Borrowers Table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    MembershipDate DATE
);

-- Insert Borrowers
INSERT INTO Borrowers
(BorrowerID, FirstName, LastName, MembershipDate)
VALUES (
    1, 'John', 'Doe',
    TO_DATE('2023-01-01', 'YYYY-MM-DD')
);

INSERT INTO Borrowers
(BorrowerID, FirstName, LastName, MembershipDate)
VALUES (
    2, 'Jane', 'Smith',
    TO_DATE('2023-02-15', 'YYYY-MM-DD')
);

-- Display Borrowers
SELECT * FROM Borrowers;


-- 5. Create BorrowedBooks Table
CREATE TABLE BorrowedBooks (
    BorrowerID INT,
    BookID INT,
    BorrowedDate DATE,
    ReturnDate DATE,
    PRIMARY KEY (BorrowerID, BookID),
    FOREIGN KEY (BorrowerID)
        REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
);

-- Insert Borrowed Book Details
INSERT INTO BorrowedBooks
(BorrowerID, BookID, BorrowedDate, ReturnDate)
VALUES (
    1, 1,
    TO_DATE('2023-03-01', 'YYYY-MM-DD'),
    TO_DATE('2023-03-15', 'YYYY-MM-DD')
);

INSERT INTO BorrowedBooks
(BorrowerID, BookID, BorrowedDate, ReturnDate)
VALUES (
    2, 3,
    TO_DATE('2023-03-05', 'YYYY-MM-DD'),
    TO_DATE('202
