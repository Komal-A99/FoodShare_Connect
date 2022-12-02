PURGE RECYCLEBIN;
-----------------------------FUNCTION TO ALLOCATE VOLUNTEER TO PICK UP THE DONATION-------------------------------
CREATE OR REPLACE FUNCTION VERIFY_INCOME 
(
  recipient_id number
) 
RETURN NUMBER AS 
income VARCHAR2(30);
BEGIN
  SELECT R_INCOME INTO income FROM RECIPIENT WHERE r_id = recipient_id;
  DBMS_OUTPUT.PUT_LINE('**************INCOME: ' || income || '******************');
   IF (income < '28000')
   THEN
        DBMS_OUTPUT.PUT_LINE('**************INCOME IS LESS THAN 28000******************');
        RETURN 1;
   ELSE
        DBMS_OUTPUT.PUT_LINE('**************INCOME IS MORE THAN 28000******************');
        RETURN 0;
   END IF;
END VERIFY_INCOME;
/


 
