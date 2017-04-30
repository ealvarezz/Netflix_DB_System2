----------------3.3 Customer-Level Transactions-------------------

/* A customer's currently held movies */

DELIMITER $$
CREATE PROCEDURE ListHeld(IN customer CHAR(64))
BEGIN
SELECT    M.Id, M.Name
FROM    Movie M, FuegoOrder F
WHERE     F.CustomerId = customer AND F.MovieId = M.id AND f.STATE = 'Held';
END $$
DELIMITER ;


/* CALL ListHeld("vicdu@cs.sunysb.edu");
This query takes an email as a parameter and it will return all movies that that customer ordered with the status of held */



/* A customer's queue of movies they would like to see */

DELIMITER $$
CREATE PROCEDURE Customer_Wish_List(IN person_id INT)
BEGIN
START TRANSACTION;

  SELECT M.*
  FROM CUSTOMER C, MOVIE M, QUEUED Q, ACCOUNT A
  WHERE C.PersonId = person_id AND A.CustomerId = C.Email
  AND A.AcctNum = Q.AccountId AND Q.MovieId = M.id;

END $$
DELIMITER ;

/* CALL Customer_Wish_List(2);
When we want to get the wish list of the customer with an Id number of 2*/



/* A customer's account settings */
DELIMITER $$
CREATE PROCEDURE GetCustomerAccount(IN email CHAR(64))
BEGIN
START TRANSACTION;
  SELECT A.*
  FROM Account A
  WHERE A.CustomerId=email;
END $$
DELIMITER ;

/* GetCustomerAccount('pml@cs.sunysb.edu')
*/


/*All Orders From a Customer*/
DELIMITER $$
CREATE PROCEDURE AllOrders(IN customer CHAR(64))
BEGIN
SELECT    *
FROM    FuegoOrder F
WHERE     F.CustomerId = customer;
END $$
DELIMITER ;

/* A history of all current and past orders a customer has placed
CALL AllOrders('vicdu@cs.sunysb.edu');
This call will take the given email and perform a query where it will return any relevant info about all order they ever placed */


/*All CURRENT(Held) Orders From a Customer*/
DELIMITER $$
CREATE PROCEDURE CurrentOrders(IN customer CHAR(64))
BEGIN
START TRANSACTION;
  SELECT    *
  FROM      FuegoOrder F
  WHERE     F.CustomerId = customer and F.State = 'Held';
COMMIT;
END $$
DELIMITER ;


/*CALL CurrentOrders('vicdu@cs.sunysb.edu');
*/

/*All Past(Returned) Orders From a Customer*/
DELIMITER $$
CREATE PROCEDURE PastOrders(IN customer CHAR(64))
BEGIN
START TRANSACTION;
  SELECT   	*
  FROM      FuegoOrder F
  WHERE     F.CustomerId = customer and F.State = 'Returned';
COMMIT;
END $$
DELIMITER ;


/*CALL PastOrders('pml@cs.sunysb.edu');
*/




/* Movies available of a particular type */

DELIMITER $$
CREATE PROCEDURE MovieByType(IN m_type CHAR(10))
BEGIN
START TRANSACTION;
  SELECT    M.*
  FROM      Movie M
  WHERE     M.MovieType = m_type;
COMMIT;
END $$
DELIMITER ;

/*CALL MovieByType("Drama");
*/





/* A customer's account settings */

DELIMITER $$
CREATE PROCEDURE List_Account_Settings(IN customer CHAR(64))
BEGIN
START TRANSACTION;
SELECT A.*
FROM Account A
WHERE customer = A.CustomerId;
COMMIT;
END $$
DELIMITER ;


/* CALL List_Account_Settings(2);
This query will take a parameter Person_Id and return any account information that the customer can edit */







/* Movies available with a particular keyword or set of keywords in the movie name */

DELIMITER $$
CREATE PROCEDURE KeywordMovie(IN keyword CHAR(64))
BEGIN

START TRANSACTION;

SET @newKeyWord = CONCAT('%', keyword, '%');

SELECT M.*
FROM MOVIE M
WHERE M.Name Like @newKeyWord;

COMMIT;
END $$
DELIMITER ;

/* CALL KeywordMovie('at');
This Query will take a list of keywords and return any Movies with a Name that contains those keywords */






/* Movies available starring a particular actor or group of actors */
/* Group of actors will need multiple calls to this procedure follow by union*/
DELIMITER $$
CREATE PROCEDURE Movies_Starring_Actor(IN Actor_Name CHAR(64))
BEGIN
START TRANSACTION;
SELECT M.*
FROM APPEAREDIN AP, Movie M, Actor A
WHERE M.Id = AP.MovieId AND AP.ActorId = A.Id AND A.Name = Actor_Name;

COMMIT;
END $$
DELIMITER ;


/*CALL Movies_Starring_Actor('Al Pacino');*/



/* Best-Seller list of movies  */

DELIMITER $$
CREATE PROCEDURE BestSellers(IN num_wanted INT)
BEGIN
SELECT 	M.*
FROM   	Movie M, FuegoOrder F
WHERE    	M.Id = F.MovieId
GROUP BY     M.name
ORDER BY     COUNT(*) DESC
LIMIT num_wanted;
END $$
DELIMITER ;

/* Gets the 3 top best selling movies. Movie id for TestMovie2 is 10 */
/*CALL BestSellers(3);*/





/* Rate the movies they have rented */

DELIMITER $$
CREATE PROCEDURE Rate_Movie_Rented(IN Customer_Id CHAR(64), IN MovieId INT, IN newRating INT)
BEGIN
START TRANSACTION;

UPDATE Movie
Inner JOIN FuegoOrder ON
		Movie.id = FuegoOrder.MovieId
    AND FuegoOrder.CustomerId = Customer_Id
    AND Movie.id = MovieId

/*Adds the new rating to the average*/
SET Rating = ((Rating*TotalRating)+newRating) / (TotalRating + 1),
    TotalRating = TotalRating + 1;

COMMIT;
END $$
DELIMITER ;

/* This will have a customer’s email and a movie Id and join both FuegoOrder and Movie Id in order to update a movie such that the email exists in the CustomerId column. For example will try to change the rating of the Borat movie to a 4*/
/* CALL Rate_Movie_Rented('vicdu@cs.sunysb.edu', 3, 4);
*/
