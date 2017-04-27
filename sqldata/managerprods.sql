-------------3.1 Manager-Level Transactions-------------------------

/* Add movie */
DELIMITER $$
CREATE PROCEDURE AddMovie(
  IN Name VARCHAR(64),
  IN MovieType VARCHAR(10),
  IN NumCopies INT,
  IN Fee DECIMAL(65,2),
  IN Rating INT
)
BEGIN
START TRANSACTION;
INSERT INTO Movie(Name, MovieType, NumCopies, Fee, Rating) VALUES
(Name,MovieType,NumCopies,Fee,Rating);
COMMIT;
END $$
DELIMITER ;

/* CALL AddMovie('Lion King','Drama',500,1.99,5); */



/* Edit Movie */
DELIMITER $$
CREATE PROCEDURE EditMovie(
/*If there is attribute that the manager doesn’t want to change, it will passed it as NULL*/
  IN Name VARCHAR(64),
  IN MovieType VARCHAR(10),
  IN NumCopies INT,
  IN Fee DECIMAL(65,2),
  IN Rating INT
)
BEGIN

START TRANSACTION;

SET @query = 'Update Movie SET ';

IF MovieType IS NOT NULL THEN
  SET @query = CONCAT(@query, 'MovieType = \'', MovieType, '\' , ');
END if;

IF NumCopies IS NOT NULL THEN
  SET @query = CONCAT(@query, 'NumCopies = ', NumCopies, ' , ');
END if;

IF Fee IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Fee = ', Fee, ' , ');
END if;

IF Rating IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Rating = ', Rating, ' , ');
END if;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE Name = \'', Name, '\';');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
COMMIT;
END $$
DELIMITER ;
/* Suppose we want to change the type of movie of Lion King into Action and we want to lower to price to $0.99 using
CALL EditMovie('Lion King','Action',NULL,0.99,NULL);*/








/*Delete the movie. Suppose the manager wants to delete the Lion King movie*/
DELIMITER $$
CREATE PROCEDURE DeleteMovie(IN M_Name CHAR(64))
BEGIN
START TRANSACTION;
DELETE FROM MOVIE
WHERE Name = M_Name;
END $$
DELIMITER ;

/* CALL DeleteMovie('Lion King'); */






/*Add Employee*/
DELIMITER $$
CREATE PROCEDURE AddEmployee(
IN Lname CHAR(24),
IN Fname CHAR(24),
IN Addr CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Tele CHAR(15),
IN Ssn INT,
IN Sdate DATE,
IN Rate DECIMAL(5,2),
IN Pos CHAR(10),
IN pass CHAR(40)
)
BEGIN
START TRANSACTION;
INSERT INTO Person (LastName, FirstName, Address, City, State, Zip, Telephone) VALUES (Lname, Fname, Addr, City, State, Zip, Tele);
SELECT P.PersonId INTO @pid FROM Person P WHERE P.FirstName = Fname AND P.LastName = Lname LIMIT 1;
INSERT INTO Employee (SSN,PersonId,StartDate,HourlyRate,Position,Password) VALUES (Ssn, @pid, Sdate, Rate, Pos, pass);
END $$
DELIMITER ;

/*
CALL AddEmployee("Grasing","Christopher","3889 New York Avenue","Seaford","NY","11783","516 785 2923",133112211,CURDATE(),100.50,"Janitor","test"); */
/* Add me as a rich Janitor*/




/*Edit Employee Data*/
DELIMITER $$
CREATE PROCEDURE EditEmployee(
IN LastName CHAR(24),
IN FirstName CHAR(24),
IN Address CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Telephone CHAR(15),
IN SSN INT,
IN StartDate DATE,
IN HourlyRate DECIMAL(5,2),
IN Position CHAR(10),
IN Password CHAR(40)
)
BEGIN

START TRANSACTION;

SET @query = 'Update Employee SET ';

IF StartDate IS NOT NULL THEN
  SET @query = CONCAT(@query, 'StartDate = \'', StartDate, '\' , ');
END if;

IF HourlyRate IS NOT NULL THEN
  SET @query = CONCAT(@query, 'HourlyRate = ', HourlyRate, ' , ');
END if;

IF Position IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Position = \'', Position, '\' , ');
END if;

IF Password IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Password = \'', Password, '\' , ');
END if;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE SSN = ', SSN, ';');


PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @query = 'Update Person SET ';

IF LastName IS NOT NULL THEN
  SET @query = CONCAT(@query, 'LastName = \'', LastName, '\' , ');
END if;

IF FirstName IS NOT NULL THEN
  SET @query = CONCAT(@query, 'FirstName = \'', FirstName, '\' , ');
END if;

IF Address IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Address = \'', Address, '\' , ');
END if;

IF City IS NOT NULL THEN
  SET @query = CONCAT(@query, 'City = \'', City, '\' , ');
END if;

IF State IS NOT NULL THEN
  SET @query = CONCAT(@query, 'State = \'', State, '\' , ');
END if;

IF Zip IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Zip = \'', Zip, '\' , ');
END if;

IF Telephone IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Telephone = \'', Telephone, '\' , ');
END if;

SELECT E.PersonId INTO @pid FROM Employee E
WHERE E.SSN = SSN LIMIT 1;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE PersonId = \'', @pid, '\';');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

COMMIT;
END $$
DELIMITER ;

/*The following call will change Mr.Grasing’s address along with a new manager position and raise his salary
CALL EditEmployee("Grasing","Christopher","38 New York Avenue","Seaford","NY","11783","516 785 2923",133112211,CURDATE(),130.59,"Manager",NULL);*/




/*Delete Employee*/

DELIMITER $$
CREATE PROCEDURE DelEmployee(
IN _ssn INT
)
BEGIN
START TRANSACTION;
SELECT P.PersonId INTO @pid FROM Person P, Employee E
WHERE E.SSN = _ssn AND E.PersonId = P.PersonId;
DELETE FROM Employee WHERE SSN = _ssn;
DELETE FROM Person WHERE PersonId = @pid;
END $$
DELIMITER ;

/*CALL DelEmployee(133112211);*/
/*Deleted Christopher Grasing from both tables via ssn*/



------*******************NEEDS WORK*************************------------
/*Obtain a sales report (i.e. the overall income from all active subscriptions)
for a particular month*/
/*DELIMITER $$
CREATE PROCEDURE SalesReport( IN month int, year int)
BEGIN
START TRANSACTION;
SELECT SUM(F.Fee) FROM FuegoOrder F
WHERE MONTH(F.TimeDate) = month and YEAR(F.TimeDate) = year;
END $$
DELIMITER ;*/

/* Call SalesReport(11,2009);
Gets the all the sale income for November in 2009*/





/*Produce a comprehensive listing of all movies*/

DELIMITER $$
CREATE PROCEDURE ALLMovies()
BEGIN

  START TRANSACTION;
  SELECT * FROM MOVIE;

COMMIT;
END $$
DELIMITER ;

/* CALL ALLMovies();
This query will just list all movies in the database */



/*Produce a list of movie rentals by movie name*/
DELIMITER $$
CREATE PROCEDURE Orders_By_MovieName(IN name char(64))
BEGIN

  START TRANSACTION;
  SELECT F.*
  FROM FuegoOrder F, Movie M
  WHERE F.MovieId = M.Id AND M.Name = name;

COMMIT;
END $$
DELIMITER ;

/* CALL Orders_By_MovieName('Borat');
*/


/*Produce a list of movie rentals by movie type*/
DELIMITER $$
CREATE PROCEDURE Orders_By_MovieType(IN type char(10))
BEGIN

  START TRANSACTION;
  SELECT F.*
  FROM FuegoOrder F, Movie M
  WHERE F.MovieId = M.Id AND M.MovieType = type;

COMMIT;
END $$
DELIMITER ;

/* CALL Orders_By_MovieType('Drama');
*/


/*Produce a list of movie rentals by customer name*/
DELIMITER $$
CREATE PROCEDURE Orders_By_Name(IN firstName char(24), lastName char(24))
BEGIN

  START TRANSACTION;
  SELECT DISTINCT F.*
  FROM FuegoOrder F, Movie M, Person P, Customer C
  WHERE F.CustomerId = C.Email AND C.PersonId = P.PersonId
   AND P.FirstName = firstName AND P.LastName = lastName;

COMMIT;
END $$
DELIMITER ;

/* CALL Orders_By_Name('Lewis','Philip');
*/


SELECT DISTINCT F.* FROM FuegoOrder F, Movie M, Person P, Customer C
WHERE F.CustomerId = C.Email AND C.PersonId = P.PersonId
AND P.LastName = 'Philip' AND P.FirstName = 'Lewis';




/*Customer representative that oversaw the most transactions (rentals)*/

DELIMITER $$
CREATE PROCEDURE MostEmployeeTrans()
BEGIN
  START TRANSACTION;

  SELECT P.FirstName, P.LastName , E.SSN, E.Position,
      Count(E.SSN) as Transactions
  FROM EMPLOYEE E, FuegoOrder F, Person P
  Where F.EmployeeId = E.SSN AND P.PersonId = E.PersonId
  GROUP BY E.SSN, E.PersonId
  ORDER BY Transactions DESC
  LIMIT 1;

COMMIT;
END $$
DELIMITER ;

/* CALL MostEmployeeTrans();
This query will return the employee that oversaw the most transactions grouping employers and returning the one with the most rows in the database */





/* Produce a list of most actively rented movies  */

DELIMITER $$
CREATE PROCEDURE MostActiveUsers(IN num_wanted INT)
BEGIN
SELECT P.FirstName, P.LastName, C.Email
FROM Customer C, Person P
WHERE P.PersonId = C.PersonId AND
    C.Email IN
    (SELECT 	F.`CustomerId`
    FROM   	FuegoOrder F
    GROUP BY 	F.`CustomerId`
    ORDER BY 	COUNT(*) DESC)
LIMIT num_wanted;
END $$
DELIMITER ;

/* TOP 10 MOST ACTIVE USERS*/
/*CALL MostActiveUsers(3);*/
/* GETS AT MOST THE INPUT PARAMETER OF THE MOST ACTIVE USERS IN DESCENDING ORDER */




/* Produce a list of most actively rented movies  */
DELIMITER $$
CREATE PROCEDURE MostActivelyRented(IN num_wanted INT)
BEGIN
SELECT 	M.Name
FROM   	Movie M, FuegoOrder F
WHERE    	M.Id = F.MovieId
GROUP BY     M.name
ORDER BY     COUNT(*) DESC
LIMIT num_wanted;
END $$
DELIMITER ;

/* TOP 10 MOST ACTIVELY RENTED MOVIES (Limited to 10)*/
/* CALL MostActivelyRented(10); */
/* Movie id 10 Is TestMovie2, 3 is Borat and so on */
