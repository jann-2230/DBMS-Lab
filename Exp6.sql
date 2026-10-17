  SET SERVEROUTPUT ON;

-- Create Customer Table
CREATE TABLE customer (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(30),
    salary NUMBER
);

-- Insert Records
INSERT INTO customer VALUES (1, 'Aarthi', 300);
INSERT INTO customer VALUES (2, 'Ramya', 500);
INSERT INTO customer VALUES (3, 'Sakthi', 670);

-- BEFORE UPDATE Trigger
CREATE OR REPLACE TRIGGER up_classd
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New value is ' || :NEW.salary);
    DBMS_OUTPUT.PUT_LINE('Old value is ' || :OLD.salary);
END;
/

-- Update Customer Salary
UPDATE customer
SET salary = 500
WHERE sid = 1;

-- Display Customer Records
SELECT * FROM customer;

-- BEFORE DELETE Trigger
CREATE OR REPLACE TRIGGER del_classb
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Row deleted');
END;
/

-- Delete Customer Record
DELETE FROM customer
WHERE sid = 1;

-- Display Remaining Records
SELECT * FROM customer;

-- Create ClassB Table
CREATE TABLE classb (
    sid NUMBER,
    sname VARCHAR2(20),
    dept VARCHAR2(10),
    stotal NUMBER,
    grade VARCHAR2(2)
);

-- BEFORE INSERT Trigger
CREATE OR REPLACE TRIGGER ins_classb
BEFORE INSERT ON classb
FOR EACH ROW
DECLARE
    InvTot EXCEPTION;
BEGIN
    IF :NEW.stotal > 1000 THEN
        RAISE InvTot;
    END IF;
EXCEPTION
    WHEN InvTot THEN
        RAISE_APPLICATION_ERROR(-20000, 'Total not valid');
END;
/

-- Valid Insert
INSERT INTO classb
VALUES (5, 'vino', 'it', 500, 'a');

-- Invalid Insert (Total exceeds 1000)
INSERT INTO classb
VALUES (6, 'jana', 'it', 2000, 'a');

Output:

Table created.
3 rows created.

Trigger created.

New value is 500
Old value is 300
1 row updated.

SID   SNAME   SALARY
1     Aarthi  500
2     Ramya   500
3     Sakthi  670

Trigger created.

Row deleted
1 row deleted.

SID   SNAME   SALARY
2     Ramya   500
3     Sakthi  670

Table created.
Trigger created.

1 row created.

ERROR: Total not valid

Result: Thus, BEFORE UPDATE, BEFORE DELETE and BEFORE INSERT triggers were created and executed successfully.
