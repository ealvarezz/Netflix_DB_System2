--------------3.2 Customer-Representative-Level Transactions--------

/* Record an order */

DELIMITER $$
CREATE PROCEDURE Add_Order(
IN MovieId INT,
IN CustomerId char(64),
IN EmployeeId INT
)
BEGIN
START TRANSACTION;

IF EXISTS(SELECT M.NumCopies FROM MOVIE M
          WHERE M.id = MovieId and M.NumCopies > 0 LIMIT 1) THEN

  UPDATE MOVIE M
  SET M.NumCopies = M.NumCopies - 1
  WHERE M.Id = MovieId LIMIT 1;

  INSERT INTO FuegoOrder (MovieId, CustomerId, EmployeeId)
  VALUES (MovieId, CustomerId, EmployeeId);

END IF;

COMMIT;
END $$
DELIMITER ;

/*CALL Add_Order(3, 'syang@cs.sunysb.edu', 123456789);
CALL Add_Order(11, 'syang@cs.sunysb.edu',123456789);
*/
/* At The new order is listed under the orderId of 7*/

/* Return Movie */
DELIMITER $$
CREATE PROCEDURE Return_Movie(
IN MovieId INT,
IN CustomerId char(64)
)

BEGIN
START TRANSACTION;

SELECT F.OrderId INTO @FOId
FROM FuegoOrder F
WHERE F.MovieId = MovieId AND F.CustomerId = CustomerId LIMIT 1;

UPDATE MOVIE M
SET M.NumCopies = M.NumCopies + 1
WHERE M.id = MovieId LIMIT 1;

Update FuegoOrder
SET STATE = 'Returned', ReturnDate = CURDATE()
WHERE OrderId = @FOId;


COMMIT;
END $$
DELIMITER ;

/* CALL Return_Movie(11, 'syang@cs.sunysb.edu'); */



/*Add Customer*/
DELIMITER $$
CREATE PROCEDURE AddCustomer(
IN Lname CHAR(24),
IN Fname CHAR(24),
IN Addr CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Tele CHAR(15),
IN email Char(64),
IN creditCard Char(20),
IN Pass CHAR(40)
)
BEGIN
START TRANSACTION;
INSERT INTO Person (LastName, FirstName, Address, City, State, Zip, Telephone) VALUES (Lname, Fname, Addr, City, State, Zip, Tele);
SELECT P.PersonId INTO @pid FROM Person P WHERE P.FirstName = Fname AND P.LastName = Lname LIMIT 1;
INSERT INTO Customer (Email,PersonId,CreditCard,Password) VALUES (email, @pid, creditCard, Pass);
END $$
DELIMITER ;


/* call AddCustomer("Memes","Bob","179 Apple street","Cupertino","CA","95014","922-360-1234",
                    "MemesAllDay@gmail.com", "9281-5191-3833- 9411","PineapplePen");
*/



/* Add information for a customer */

DELIMITER $$
CREATE PROCEDURE Add_Account(
IN AcctType CHAR(20),
IN AccountDate DATE,
IN CustomerId CHAR(64)
)

BEGIN
START TRANSACTION;
INSERT INTO Account (AcctType, AccountDate, CustomerId)
VALUES (AcctType, AccountDate, CustomerId);

END $$
DELIMITER ;

/*
CALL Add_Account('unlimited-2','2006-10-01','pml@cs.sunysb.edu');
CALL Add_Account('unlimited-1','2010-11-05','jsmith@ic.sunysb.edu');
This query add the given information about a customer */
/* The account types must be either:
('limited', 'unlimited-1', 'unlimited-2', 'unlimited-3')*/



/* Edit information for a customer */

/*Changes the name */
DELIMITER $$
CREATE PROCEDURE Edit_Customer_Name(
  IN firstName Char(24),
  IN lastName Char(24),
  IN person_id INT
)
BEGIN
START TRANSACTION;

UPDATE Person
SET FirstName = firstName, LastName = lastName
WHERE PersonId = person_id;

COMMIT;
END $$
DELIMITER ;

/* Changes the name Lewis Philip to Lu Philips
CALL Edit_Customer_Name('Lu','Philips',4);
*/

/*Changes the Email */
DELIMITER $$
CREATE PROCEDURE Edit_Customer_Email(
  IN new_email Char(64),
  IN old_email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET Email = new_email
WHERE Email = old_email;

COMMIT;
END $$
DELIMITER ;


/*Changes the Password */
DELIMITER $$
CREATE PROCEDURE Edit_Customer_Password(
  IN password Char(40),
  IN email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET Password = password
WHERE Email = email;

COMMIT;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE Edit_Customer_CreditCard(
  IN creditcard Char(40),
  IN email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET CreditCard = creditcard
WHERE Email = email;

COMMIT;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE Edit_Account_Type(
  IN acctType Char(20),
  IN email Char(64),
  IN acctNum INT
)
BEGIN
START TRANSACTION;

UPDATE Account
SET AcctType = acctType
WHERE CustomerId = email AND AcctNum = acctNum;

COMMIT;
END $$
DELIMITER ;

/*
CALL Edit_Account_Type('unlimited-3','jsmith@ic.sunysb.edu',3);
*/


/*Changes the location of customer*/
DELIMITER $$
CREATE PROCEDURE Edit_Customer_Location(
  IN address Char(50),
  IN city Char(24),
  IN state Char(2),
  IN zip Char(5),
  IN telephone Char(15),
  IN person_id INT)
BEGIN
START TRANSACTION;

UPDATE Person
SET Address = address, City = city, State = state,
    Zip = zip, Telephone = telephone
WHERE PersonId = person_id;

COMMIT;
END $$
DELIMITER ;

/* Delete information for a customer */
DELIMITER $$
CREATE PROCEDURE DelCustomer(
  IN cEmail Char(64)
)
BEGIN
START TRANSACTION;

  SELECT P.PersonId INTO @pid FROM Person P, Customer C
  WHERE C.Email = cEmail AND C.PersonId = P.PersonId;

  SELECT A.AcctNum INTO @AcNum FROM Account A
  WHERE A.CustomerId = cEmail;

  DELETE FROM FuegoOrder WHERE CustomerId = cEmail;
  DELETE FROM QUEUED WHERE AccountId = @AcNum;
  DELETE FROM Account WHERE AcctNum = @AcNum;
  DELETE FROM Customer WHERE Email = cEmail;

  /* If the customer is not also an Employee then we will delete the person*/
  IF not exists(
    SELECT * FROM Employee
    WHERE PersonId = @pid LIMIT 1)
  THEN
    DELETE FROM Person WHERE PersonId = @pid;
  END IF;

COMMIT;
END $$
DELIMITER ;


/* We shall customer delete pml@cs.sunysb.edu from the database using
CALL DelCustomer('pml@cs.sunysb.edu'); */



/*Produce customer mailing lists */

DELIMITER $$
CREATE PROCEDURE Return_Customer_Mailing_List()
BEGIN
START TRANSACTION;
  SELECT P.Address
  FROM CUSTOMER C, Person P
  WHERE P.PersonId = C.PersonId;
COMMIT;
END $$
DELIMITER ;

/* CALL Return_Customer_Mailing_List();
This will give us the addresses of all customers*/




/*Produce customer available for adding order */
DELIMITER $$
CREATE PROCEDURE Return_Availble_For_Order()
BEGIN
START TRANSACTION
 	 SELECT   DISTINCT C.*
   FROM  		Customer C, FuegoOrder F , Account A
 	 WHERE   	C.Email = F.CustomerId AND A.CustomerId = C.Email

   AND
















DELIMITER $$
CREATE PROCEDURE Return_Availble_For_Order()
BEGIN
START TRANSACTION
 	 SELECT   	 C.*
   FROM  		 Customer C, FuegoOrder F , Account A
 	 WHERE   	 C.Email != F.CustomerId AND A.CustomerId = C.Email AND (

 		 (
 			 A.AcctType = "limited"
 			 AND (
 				 SELECT COUNT(*)
 				 WHERE C.Email = F.CustomerId AND F.STATE = "Held"
 			 ) < 1
 		 )
 		 OR
 		 (
 			 A.AcctType = "unlimited-1"
 			 AND (
 				 SELECT COUNT(*)
 				 WHERE C.Email = F.CustomerId AND F.STATE = "Held"
 			 ) < 1
 		 )
 		 OR
 		 (
 			 A.AcctType = "unlimited-2"
 			 AND (
 				 SELECT COUNT(*)
 				 WHERE C.Email = F.CustomerId AND F.STATE = "Held"
 			 ) < 2
 		 )
 		 OR
 		 (
 			 A.AcctType = "unlimited-3"
 			 AND (
 				 SELECT COUNT(*)
 				 WHERE C.Email = F.CustomerId AND F.STATE = "Held"
 			 ) < 3
 		 )

 	 )

   OR NOT EXIST(
     SELECT C.* FROM
   )

/*
 COMMIT;
 END $$
 DELIMITER ;*/


 Select *
