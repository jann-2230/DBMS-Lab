CREATE TABLE customer (
    custid NUMBER PRIMARY KEY,
    cname VARCHAR2(30),
    phone VARCHAR2(15)
);

CREATE TABLE account (
    accno NUMBER PRIMARY KEY,
    custid NUMBER REFERENCES customer(custid),
    balance NUMBER(10,2) CHECK (balance >= 0)
);

CREATE TABLE transactions (
    txnid NUMBER PRIMARY KEY,
    accno NUMBER REFERENCES account(accno),
    txntype VARCHAR2(10),
    amount NUMBER(10,2),
    balance_after NUMBER(10,2),
    txntime DATE DEFAULT SYSDATE
);

INSERT INTO customer VALUES (1, 'Ajay', '9876543210');
INSERT INTO account VALUES (101, 1, 5000);

INSERT INTO transactions
VALUES (1, 101, 'OPEN', 5000, 5000, SYSDATE);

-- Deposit
UPDATE account
SET balance = balance + 2000
WHERE accno = 101;

INSERT INTO transactions
VALUES (2, 101, 'DEPOSIT', 2000, 7000, SYSDATE);

-- Withdraw
UPDATE account
SET balance = balance - 1000
WHERE accno = 101;

INSERT INTO transactions
VALUES (3, 101, 'WITHDRAW', 1000, 6000, SYSDATE);

COMMIT;

-- Display account details
SELECT * FROM customer;
SELECT * FROM account;
SELECT * FROM transactions;
