CREATE OR REPLACE TRIGGER income_after_update
AFTER UPDATE
   ON recipient
REFERENCING NEW AS NEW OLD AS OLD  
FOR EACH ROW
BEGIN

   INSERT INTO income_changes
   ( R_username,
     changed_at,
     old_income,
     new_income )
   VALUES
   ( :new.R_username,
     SYSDATE,
     :old.R_INCOME,
     :new.R_INCOME);

END;
/


CREATE OR REPLACE TRIGGER volunteer_before_delete
BEFORE DELETE
   ON volunteer
   FOR EACH ROW

BEGIN

   -- Insert record into audit table
   INSERT INTO Deleted_Volunteer_Records
   ( V_ID,
     V_FIRST_NAME,
     V_LAST_NAME,
     V_USERNAME,
     V_PWD,
     V_MOBILE_NO,
     V_ADDRESS,
     ZIP_CODE,
     V_ACTIVE,
     V_AVAILABILITY,
     V_DATE_REGISTRATION,
     V_DELETED_DATE)
   VALUES
   ( :old.V_ID,
     :old.V_FIRST_NAME,
     :old.V_LAST_NAME,
     :old.V_USERNAME,
     :old.V_PWD,
     :old.V_MOBILE_NO,
     :old.V_ADDRESS,
     :old.ZIP_CODE,
     :old.V_ACTIVE,
     :old.V_AVAILABILITY,
     :old.V_DATE_REGISTRATION,
      sysdate );

END;
/