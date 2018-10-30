DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

CREATE TABLE Accounts (
	ID	 int	 not null	 primary key	 auto_increment,
	account_holder	 varchar(50)	 not null	UNIQUE,
	balance	 decimal(18,2)	 not null,
	fees	 decimal(18,2)	 not null
);

CREATE TABLE Transactions (
	ID	 int	primary key	 auto_increment,
    amount	 decimal(18,2)	 not null,
    txn_type	 varchar(10)	 not null,
    account_ID	 int	 not null,
    FOREIGN KEY (ACCOUNT_ID) REFERENCES Accounts (ID) 
);

INSERT INTO Accounts VALUES
 ('1','Gary Henderson','8,888.00','######'),
 ('2','Meagan Hansen','5,444.00','######'),
 ('3','Nick Law','3,333.00','$ 88.00'),
 ('4','Yelena Lapina','3,322.00','$ 88.00');

INSERT INTO Transactions Values 
('1','$ 500.00','Deposit','3'),
('2','$(200.00)','Withdrawal','4'),
('3','$ 200.00','Deposit','4'),
('4','$ 248.00','Deposit','1');


CREATE USER 'bank_db'@'localhost' 
IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE
ON bank_.*
TO 'bank_db_user'@'localhost';
