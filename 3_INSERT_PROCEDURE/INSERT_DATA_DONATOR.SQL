CREATE OR REPLACE 
PACKAGE INSERT_DATA_DONATOR AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
PROCEDURE INSERT_DONATOR_DETAILS(D_Username in VARCHAR2,D_Pwd IN VARCHAR2,D_First_Name IN VARCHAR2,D_Last_Name IN VARCHAR2,D_Mobile_No IN VARCHAR2,D_Address IN VARCHAR2,Zip_Code IN VARCHAR2,D_Registration_Date IN DATE);
PROCEDURE INSERT_DONATION(D_ID in NUMBER,DO_Date in DATE, V_ID in NUMBER);
END INSERT_DATA_DONATOR;
/

create or replace PACKAGE BODY INSERT_DATA_DONATOR
	AS

PROCEDURE INSERT_DONATOR_DETAILS(D_Username in VARCHAR2,D_Pwd IN VARCHAR2,D_First_Name IN VARCHAR2,D_Last_Name IN VARCHAR2,D_Mobile_No IN VARCHAR2,D_Address IN VARCHAR2,Zip_Code IN VARCHAR2,D_Registration_Date IN DATE) 
  AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into Donator(D_USERNAME,D_Pwd,D_First_Name,D_Last_Name,D_Mobile_No,D_Address,Zip_Code,D_Registration_Date) values (D_Username,D_Pwd,D_First_Name,D_Last_Name,D_Mobile_No,D_Address,Zip_Code,D_Registration_Date);
	dbms_output.put_line('Row inserted into Donator Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in Donator! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into Donator Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
  END INSERT_DONATOR_DETAILS;
  
  PROCEDURE INSERT_DONATION(D_ID in NUMBER,DO_Date in DATE, V_ID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	INSERT INTO DONATION(D_ID,DO_Date,V_ID) VALUES (D_ID,DO_Date,V_ID);
	dbms_output.put_line('Row inserted into DONATION Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in DONATION table! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into DONATION Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_DONATION;


end;
/