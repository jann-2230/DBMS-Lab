EXPERIMENT 10

Aim

To perform database operations using MongoDB.

Program

// Select the library database
use library;

// Insert author details
db.authors.insertMany([
    {
        AuthorID: 1,
        FirstName: "George",
        LastName: "Orwell"
    },
    {
        AuthorID: 2,
        FirstName: "Aldous",
        LastName: "Huxley"
    },
    {
        AuthorID: 3,
        FirstName: "J.K.",
        LastName: "Rowling"
    }
]);

// Insert book details
db.books.insertMany([
    {
        BookID: 1,
        Title: "1984",
        AuthorID: 1
    },
    {
        BookID: 2,
        Title: "Brave New World",
        AuthorID: 2
    },
    {
        BookID: 3,
        Title: "Harry Potter and the Sorcerers Stone",
        AuthorID: 3
    }
]);

// Insert borrower details
db.borrowers.insertMany([
    {
        BorrowerID: 1,
        FirstName: "John",
        LastName: "Doe"
    },
    {
        BorrowerID: 2,
        FirstName: "Jane",
        LastName: "Smith"
    }
]);

// Insert borrowed book details
db.borrowedBooks.insertMany([
    {
        BorrowID: 1,
        BookID: 1,
        BorrowerID: 1,
        BorrowDate: new Date("2024-01-10"),
        ReturnDate: new Date("2024-01-20")
    },
    {
        BorrowID: 2,
        BookID: 2,
        BorrowerID: 2,
        BorrowDate: new Date("2024-02-05"),
        ReturnDate: new Date("2024-02-15")
    }
]);

// Update author details
db.authors.updateOne(
    { AuthorID: 1 },
    { $set: { LastName: "Smith" } }
);

// Display author details after updating
db.authors.find().pretty();

// Delete an author
db.authors.deleteOne({ AuthorID: 1 });

// Display author details after deleting
db.authors.find().pretty();

Result

Thus, database operations such as inserting, updating, displaying, and deleting records were performed successfully using MongoDB.
