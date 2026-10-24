CREATE TABLE employeepersonaldetails (
    id INT PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    age INT NOT NULL,
    mobilenumber NUMBER(10) NOT NULL UNIQUE
);

INSERT INTO employeepersonaldetails
VALUES (1, 'Ajay', 20, 9876543210);

INSERT INTO employeepersonaldetails
VALUES (2, 'Brindha', 20, 9874563210);

INSERT INTO employeepersonaldetails
VALUES (3, 'Kumaran', 20, 9673443210);

SELECT * FROM employeepersonaldetails;

COMMIT;

INSERT INTO employeepersonaldetails
VALUES (4, 'Archana', 20, 9876543410);

ROLLBACK;

SELECT * FROM employeepersonaldetails;

INSERT INTO employeepersonaldetails
VALUES (5, 'Braham', 20, 9878953210);

SAVEPOINT a;

INSERT INTO employeepersonaldetails
VALUES (6, 'Srimathi', 20, 9678953210);

SAVEPOINT b;

SELECT * FROM employeepersonaldetails;

ROLLBACK TO a;

SELECT * FROM employeepersonaldetails;

COMMIT;

-- Account transaction example
CREATE TABLE account (
    accno INT PRIMARY KEY,
    cname VARCHAR2(20),
    balance NUMBER(10,2)
);

INSERT INTO account VALUES (101, 'Ajay', 5000);
INSERT INTO account VALUES (102, 'Brindha', 3000);

COMMIT;

UPDATE account
SET balance = balance - 1000
WHERE accno = 101;

SAVEPOINT debited;

UPDATE account
SET balance = balance + 1000
WHERE accno = 102;

SELECT * FROM account;

ROLLBACK TO debited;

SELECT * FROM account;

ROLLBACK;

SELECT * FROM account;
