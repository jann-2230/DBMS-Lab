Program

SET SERVEROUTPUT ON;

-- Create Customers Table
CREATE TABLE customers (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    age NUMBER,
    address VARCHAR2(50),
    salary NUMBER(10, 2)
);

-- Insert Records
INSERT INTO customers
VALUES (1, 'Ramesh', 32, 'Ahmadabad', 2000.00);

INSERT INTO customers
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00);

INSERT INTO customers
VALUES (3, 'Kaushik', 23, 'Kota', 2000.00);

INSERT INTO customers
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00);

INSERT INTO customers
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00);

INSERT INTO customers
VALUES (6, 'Komal', 22, 'MP', 4500.00);

COMMIT;


-- 1. System-Defined Exception

DECLARE
    c_id customers.id%TYPE := 5;
    c_name customers.name%TYPE;
    c_addr customers.address%TYPE;
BEGIN
    SELECT name, address
    INTO c_name, c_addr
    FROM customers
    WHERE id = c_id;

    DBMS_OUTPUT.PUT_LINE('name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('address: ' || c_addr);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('no such customer!');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('error!');
END;
/

-- Output:
-- name: Hardik
-- address: Bhopal
-- PL/SQL procedure successfully completed.


-- 2. User-Defined Exception

DECLARE
    c_id customers.id%TYPE := &cc_id;
    c_name customers.name%TYPE;
    c_addr customers.address%TYPE;
    ex_invalid_id EXCEPTION;
BEGIN
    IF c_id <= 0 THEN
        RAISE ex_invalid_id;
    ELSE
        SELECT name, address
        INTO c_name, c_addr
        FROM customers
        WHERE id = c_id;

        DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
        DBMS_OUTPUT.PUT_LINE('Address: ' || c_addr);
    END IF;

EXCEPTION
    WHEN ex_invalid_id THEN
        DBMS_OUTPUT.PUT_LINE('ID must be greater than zero!');

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No such customer!');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END;
/

-- Sample Output:
-- Enter value for cc_id: -6
-- ID must be greater than zero!
-- PL/SQL procedure successfully completed.

Result

Thus, system-defined and user-defined exceptions were implemented successfully using PL/SQL.
