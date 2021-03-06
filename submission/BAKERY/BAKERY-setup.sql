-- Jeffrey McGovern
-- jmcgover@calpoly.edu

CREATE TABLE goods(
   Id          CHAR(30) PRIMARY KEY,
   Flavor      CHAR(30),
   Food        CHAR(30),
   Price       FLOAT 
);

CREATE TABLE customers(
   Id          INT PRIMARY KEY,
   LastName    CHAR(30),
   FirstName   CHAR(30)
);

CREATE TABLE receipts(
   ReceiptNumber  INT PRIMARY KEY,
   Date           DATE,
   CustomerId     INT,
   FOREIGN KEY(CustomerId) REFERENCES customers(Id)
);

-- ON DELETE CASCADE 
CREATE TABLE items(
   Receipt     INT,
   Ordinal     INT,
   Item        CHAR(30),
   PRIMARY KEY(Receipt, Ordinal),
   FOREIGN KEY(Receipt) REFERENCES receipts(ReceiptNumber),
   CONSTRAINT `ItemReference` FOREIGN KEY(Item) REFERENCES goods(Id)
);
