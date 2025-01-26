
DROP TABLE version_info;
DROP TABLE customer;
DROP TABLE invoice;
DROP TABLE invoice_items;


CREATE TABLE version_info (
    version str
);
INSERT INTO version_info VALUES (0);

CREATE TABLE customer (
    id int primary key,
    name str
);
CREATE TABLE invoice (
    id int primary key,
    customer_id int,
    dateCreated str,
    dateCreated_epoch int,
    FOREIGN KEY(customer_id) REFERENCES customer(id)
);
CREATE TABLE invoice_items (
    id int primary key,
    invoice_id int,
    name str,
    price float,
    FOREIGN KEY(invoice_id) REFERENCES invoice(id)
);

INSERT INTO customer VALUES(0, "alice");
INSERT INTO customer VALUES(1, "bob");
INSERT INTO invoice VALUES(0, 1, "2025-01-01 01:02:03Z", 2.00);
INSERT INTO invoice_items VALUES(0, 0, "thing a", 1.00);
INSERT INTO invoice_items VALUES(1, 0, "thing b", 1.00);

/*
PRAGMA table_info(customer);
PRAGMA table_info(invoice);
PRAGMA index_list(invoice);
PRAGMA table_info(invoice_items);
PRAGMA index_list(invoice_items);
*/

SELECT "##";

SELECT "## table=customer";
SELECT * from customer;
SELECT "## table=invoice";
SELECT * from invoice;
SELECT "## table=invoice_items";
SELECT * from invoice_items;
