/* create schema ecommercewebman */


   CREATE SCHEMA IF NOT EXISTS `ecommercewebman` ;

   use `ecommercewebman`;



/* Creating table supplier */


    CREATE TABLE IF NOT EXISTS `ecommercewebman`.`supplier` (
  `SUPP_ID` INT NOT NULL  PRIMARY KEY,
  `SUPP_NAME` VARCHAR(50) NOT NULL,
  `SUPP_CITY` VARCHAR(50) NOT NULL,
  `SUPP_PHONE` VARCHAR(50) NOT NULL);



/* Creating tale customer */ 


   CREATE TABLE IF NOT EXISTS `ecommercewebman`.`customer` (
  `CUS_ID` INT NOT NULL PRIMARY KEY,
  `CUS_NAME` VARCHAR(20) NOT NULL,
  `CUS_PHONE` VARCHAR(10) NOT NULL,
  `CUS_CITY` VARCHAR(30) NOT NULL,
  `CUS_GENDER` CHAR );



/* Creating table category */


  CREATE TABLE IF NOT EXISTS `ecommercewebman`.`category` (
  `CAT_ID` INT NOT NULL PRIMARY KEY,
  `CAT_NAME` VARCHAR(20) NOT NULL);



/* creating table product */


   CREATE TABLE IF NOT EXISTS `ecommercewebman`.`product` (
  `PRO_ID` INT NOT NULL PRIMARY KEY,
  `PRO_NAME` VARCHAR(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` VARCHAR(60) ,
  `CAT_ID` INT ,
	FOREIGN KEY (`CAT_ID`)
    REFERENCES `ecommercewebman`.`category` (`CAT_ID`));



/* creating table supplier pricing */
 


   CREATE TABLE IF NOT EXISTS `ecommercewebman`.`supplier_pricing` (
  `PRICING_ID` INT NOT NULL PRIMARY KEY,
  `PRO_ID` INT ,
  `SUPP_ID` INT ,
  `SUPP_PRICE` INT DEFAULT 0,
	FOREIGN KEY (`PRO_ID`)
    REFERENCES `ecommercewebman`.`product` (`PRO_ID`),
    FOREIGN KEY (`SUPP_ID`)
	REFERENCES `ecommercewebman`.`supplier` (`SUPP_ID`));



/* creating table order */
 


  CREATE TABLE IF NOT EXISTS `ecommercewebman`.`order` (
  `ORD_ID` INT NOT NULL  PRIMARY KEY ,
  `ORD_AMOUNT` INT NOT NULL,
  `ORD_DATE` DATE NOT NULL,
  `CUS_ID` INT ,
  `PRICING_ID` INT ,
	FOREIGN KEY (`CUS_ID`)
    REFERENCES `ecommercewebman`.`customer` (`CUS_ID`),
    FOREIGN KEY (`PRICING_ID`)
    REFERENCES `ecommercewebman`.`supplier_pricing` (`PRICING_ID`));

    


/*  creating table rating  */



   CREATE TABLE IF NOT EXISTS `ecommercewebman`.`rating` (
  `RAT_ID` INT NOT NULL  PRIMARY KEY ,
  `ORD_ID` INT ,
  `RAT_RATSTARS` INT NOT NULL,
    FOREIGN KEY (`ORD_ID`)
    REFERENCES `ecommercewebman`.`order` (`ORD_ID`));




/* Inserting values into supplier table */ 



  INSERT INTO `ecommercewebman`.`supplier` 
(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES 
(1,'Rajesh Retails','Delhi','1234567890'),
(2,'Appario Ltd.','Mumbai','2589631470'),
(3,'Knome products','Banglore','9785462315'),
(4,'Bansal Retails','Kochi','8975463285'),
(5,'Mittal Ltd.','Lucknow','7898456532');





/* Inserting values into customer table */




   INSERT INTO `ecommercewebman`.`customer` 
(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
VALUES 
(1,'AAKASH','9999999999','DELHI','M'),
(2,'AMAN','9785463215','NOIDA','M'),
(3,'NEHA','9999999999','MUMBAI','F'),
(4,'MEGHA','9994562399','KOLKATA','F'),
(5,'PULKIT','7895999999','LUCKNOW','M');





/*  Inserting values into category table */
 



   INSERT INTO `ecommercewebman`.`category` 
(CAT_ID,CAT_NAME)
VALUES 
(1,'BOOKS'),
(2,'GAMES'),
(3,'GROCERIES'),
(4,'ELECTRONICS'),
(5,'CLOTHES');





/*  Inserting values into product table  */
 



    INSERT INTO `ecommercewebman`.`product` 
(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
VALUES 
(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
(4,'OATS','Highly Nutritious from Nestle',3),
(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
(6,'MILK','1L Toned MIlk',3),
(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),
(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
(9,'Project IGI','compatible with windows 7 and above',2),
(10,'Hoodie','Black GUCCI for 13 yrs and above',5),
(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),
(12,'Train Your Brain','By Shireen Stephen',1);





/* inserting values into supplier pricing */




    INSERT INTO `ecommercewebman`.`supplier_pricing` 
(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
VALUES 
(1,1,2,1500),
(2,3,5,30000),
(3,5,1,3000),
(4,2,3,2500),
(5,4,1,1000),
(6,12,2,780),
(7,12,4,789),
(8,3,1,31000),
(9,1,5,1450),
(10,4,2,999),
(11,7,3,549),
(12,7,4,529),
(13,6,2,105),
(14,6,1,99),
(15,2,5,2999),
(16,5,2,2999);





/*  Inserting values into order table  */
 



    INSERT INTO `ecommercewebman`.`order` 
(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)
VALUES 
(101,1500,'2021-10-06',2,1),
(102,1000,'2021-10-12',3,5),
(103,30000,'2021-09-16',5,2),
(104,1500,'2021-10-05',1,1),
(105,3000,'2021-08-16',4,3),
(106,1450,'2021-08-18',1,9),
(107,789,'2021-09-01',3,7),
(108,780,'2021-09-07',5,6),
(109,3000,'2021-00-10',5,3),
(110,2500,'2021-09-10',2,4),
(111,1000,'2021-09-15',4,5),
(112,789,'2021-09-16',4,7),
(113,31000,'2021-09-16',1,8),
(114,1000,'2021-09-16',3,5),
(115,3000,'2021-09-16',5,3),
(116,99,'2021-09-17',2,14);






/*  Inserting values into rating table  */
 


    
      INSERT INTO `ecommercewebman`.`rating` 
(RAT_ID,ORD_ID,RAT_RATSTARS)
VALUES 
(1,101,4),
(2,102,3),
(3,103,1),
(4,104,2),
(5,105,4),
(6,106,3),
(7,107,4),
(8,108,4),
(9,109,3),
(10,110,5),
(11,111,3),
(12,112,4),
(13,113,2),
(14,114,1),
(15,115,1),
(16,116,0);






#QUERIES





/* 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000   */


SELECT count(CUS_ID) AS Total_No_Of_Customer,CUS_GENDER AS Customer_Gender  
FROM `ecommercewebman`.`customer`
WHERE CUS_ID IN (SELECT CUS_ID FROM `ecommercewebman`.`order` GROUP BY CUS_ID HAVING SUM(ORD_AMOUNT) >= 3000) 
GROUP BY CUS_GENDER;




/*  4) Display all the orders along with product name ordered by a customer having Customer_Id=2  */


SELECT ord.ORD_ID, ord.ORD_AMOUNT,ord.ORD_DATE,sp.PRICING_ID,product.PRO_NAME,ord.CUS_ID
FROM `ecommercewebman`.`order` ord 
INNER JOIN `ecommercewebman`.`supplier_pricing` sp
ON ord.PRICING_ID = sp.PRICING_ID
INNER JOIN `ecommercewebman`.`product` product
ON sp.PRO_ID = product.PRO_ID
WHERE ord.CUS_ID=2;





/*   5) Display the Supplier details who can supply more than one product.  */


SELECT supplier.*
FROM `ecommercewebman`.`supplier` supplier
WHERE supplier.SUPP_ID 
IN (
	SELECT sp.SUPP_ID 
    FROM `ecommercewebman`.`supplier_pricing` sp
    GROUP BY sp.SUPP_ID
    HAVING COUNT(sp.PRO_ID) > 1);





/*  6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product   */


SELECT category.CAT_ID,category.CAT_NAME,T2.PRO_NAME,min(T2.minimum_price) as Min_Price
FROM `ecommercewebman`.`category` category
INNER JOIN (
	SELECT product.CAT_ID,product.PRO_NAME,T1.*
    FROM `ecommercewebman`.`product` product
    INNER JOIN (
		SELECT sp.PRO_ID,MIN(sp.SUPP_PRICE) AS Minimum_Price 
        FROM `ecommercewebman`.`supplier_pricing` sp
        group by sp.PRO_ID
    )
    AS T1 
    WHERE T1.PRO_ID = product.PRO_ID
)
AS T2 
WHERE T2.CAT_ID = category.CAT_ID 
GROUP BY T2.CAT_ID
ORDER BY T2.CAT_ID;





/*  7) Display the Id and Name of the Product ordered after “2021-10-05”.  */


SELECT product.PRO_ID,product.PRO_NAME
FROM `ecommercewebman`.`order` ord
INNER JOIN `ecommercewebman`.`supplier_pricing` sp
ON sp.PRICING_ID=ord.PRICING_ID
INNER JOIN `ecommercewebman`.`product` product
ON product.PRO_ID=sp.PRO_ID
WHERE ord.ORD_DATE>"2021-10-05";




/*  8) Display customer name and gender whose names start or end with character 'A'. */


SELECT customer.CUS_NAME,customer.CUS_GENDER 
FROM `ecommercewebman`.`customer` customer 
WHERE customer.cus_name LIKE 'A%' OR customer.cus_name LIKE '%A';






/*  9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 

    If rating =5, print serviceProcserviceProcserviceProc“Excellent Service”,
    If rating >4 print “Good Service”, 
    If rating >2 print “Average Service” 
    else print “Poor Service”. */		





DELIMITER &&
CREATE PROCEDURE TTypeOfService()
BEGIN
SELECT SUP.SUPP_ID AS Supplier_ID , SUP.SUPP_NAME AS Supplier_Name , AVG(RAT_RATSTARS) AS Rating,
CASE
WHEN AVG(RAT_RATSTARS) = 5 THEN 'Excellent Service'
WHEN AVG(RAT_RATSTARS) > 4 THEN 'Good Service'
WHEN AVG(RAT_RATSTARS) > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS TheType_of_Service
FROM supplier AS SUP, rating AS R, supplier_pricing AS SP, `order` AS O 
WHERE R.ORD_ID = O.ORD_ID AND O.PRICING_ID = SP.PRICING_ID AND SP.SUPP_ID = SUP.SUPP_ID
GROUP BY SUP.SUPP_ID 
ORDER BY SUP.SUPP_ID ASC;
END&&
DELIMITER ;

CALL TTypeOfService();

