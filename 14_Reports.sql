
-------------------------REPORT------------------------------------
--1. PRINT THE LIST OF ALL ITEMS WITH THEIR RESPECTIVE CATEGORIES

CREATE OR REPLACE VIEW Report_1 AS
SELECT FC.CATEGORY_NAME,FD.FOOD_ITEM
FROM   FOOD_CATEGORY FC
INNER  JOIN FOOD_ITEM_DETAILS FD ON FC.CAT_ID = FD.CAT_ID;

--2. PRINT FIRST NAME AND LAST NAME OF RECIPIENTS WHO RECEIVED FOOD IN THE MONTH OF NOV 2022

CREATE OR REPLACE VIEW Report_2 AS
SELECT R1.R_FIRST_NAME,R1.R_LAST_NAME
FROM   RECIPIENT R1
INNER  JOIN FOOD_ALLOCATION FA ON R1.R_USERNAME=FA.R_USERNAME
WHERE  FA.STATUS = 'Received'
AND    FA.CLAIMED_DATE BETWEEN DATE '2022-11-01' AND DATE '2022-11-30';


--3. LIST OF VOLUNTEERS WHO JOINED FOOD_PANTRY IN THE YEAR 2021 AND WORKED FOR FOOD PICK IN THE MONTH OF OCT 2022. 

CREATE OR REPLACE VIEW Report_3 AS
SELECT V_USERNAME,V_FIRST_NAME,V_LAST_NAME,D1.DO_DATE DONATION_PICKUP_DATE
FROM VOLUNTEER S1
INNER JOIN DONATION D1       ON       S1.V_ID = D1.V_ID
WHERE S1.V_DATE_REGISTRATION BETWEEN DATE '2021-01-01' AND DATE '2021-12-31'
AND   D1.DO_DATE  BETWEEN DATE '2022-01-01' AND DATE '2022-12-31';




--4. LIST ALL THE DONATORS WHO DONATED VEGETABLES AND FROZEN FOOD IN THE MONTH OF NOVEMBER THIS YEAR. ALSO LIST FOOD ITEMS DONATED IN THE
--CATEGORY OF VEGETABLE,FROZEN AND WHOSE PACKAGE MADE COUNT IS MORE THAN 10

CREATE OR REPLACE VIEW Report_4 AS
SELECT DT.D_FIRST_NAME,DT.D_LAST_NAME,FI.FOOD_ITEM
FROM       DONATOR DT
INNER JOIN DONATION D1                  ON  DT.D_ID     =  D1.D_ID
INNER JOIN DONATION_DETAILS   DDT       ON  DDT.DO_ID   =  D1.DO_ID
INNER JOIN FOOD_CATEGORY      FC        ON  FC.CAT_ID   =  DDT.CAT_ID
INNER JOIN FOOD_ITEM_DETAILS  FI        ON  FC.CAT_ID   =  FI.CAT_ID       
WHERE      CATEGORY_NAME                IN ( 'VEGETABLES','FROZEN') 
AND        D1.DO_DATE                   BETWEEN DATE '2022-11-01' AND DATE '2022-11-30'
AND        DDT.TOTAL_PACKETS_MADE        > 10;


--5. SELECT FIRST NAME AND LAST NAME OF VOLUNTEERS WHO PICKED FOOD FROM DONATOR JACK AND ADALINE, DISPLAY THE DONATION DATE AND COUNT OF PACKETS MADE 
--FROM THAT DONATION

CREATE OR REPLACE VIEW Report_5 AS
SELECT S1.V_FIRST_NAME,S1.V_LAST_NAME,DDT.TOTAL_PACKETS_MADE,D1.DO_DATE
FROM  VOLUNTEER S1 
INNER JOIN DONATION D1          ON S1.V_ID      = D1.V_ID
INNER JOIN DONATOR DT           ON D1.D_ID      = DT.D_ID
INNER JOIN DONATION_DETAILS DDT ON DDT.DO_ID    = D1.DO_ID
WHERE DT.D_FIRST_NAME IN( 'Campbell','ROBINSON');

------------------------------VIEWS----------------------------
SELECT * FROM REPORT_1;
SELECT * FROM REPORT_2;
SELECT * FROM REPORT_3;
SELECT * FROM REPORT_4;
SELECT * FROM REPORT_5;

