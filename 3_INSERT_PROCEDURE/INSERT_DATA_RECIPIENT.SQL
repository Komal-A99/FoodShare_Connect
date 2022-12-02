CREATE OR REPLACE 
PACKAGE INSERT_DATA_RECIPIENT AS 
  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
PROCEDURE INSERT_RECIPIENT_DETAILS(R_Username in VARCHAR2, National_ID in NUMBER,R_Pwd in VARCHAR2,R_First_Name in VARCHAR2, R_Last_Name in VARCHAR2,R_Mobile_No in VARCHAR2,R_Address in VARCHAR2, Zip_Code in VARCHAR2,R_Income in VARCHAR2,R_DATE_REGISTRATION in DATE);
PROCEDURE INSERT_FOOD_ALLOCATION_DETAILS(R_Username IN VARCHAR2,Status IN VARCHAR2,Claimed_Date IN DATE,DOD_ID IN NUMBER,V_ID IN NUMBER);
END INSERT_DATA_RECIPIENT;
/

create or replace PACKAGE BODY INSERT_DATA_RECIPIENT
	AS

PROCEDURE INSERT_RECIPIENT_DETAILS(R_Username in VARCHAR2, National_ID in NUMBER,R_Pwd in VARCHAR2,R_First_Name in VARCHAR2, R_Last_Name in VARCHAR2,R_Mobile_No in VARCHAR2,R_Address in VARCHAR2, Zip_Code in VARCHAR2,R_Income in VARCHAR2,R_DATE_REGISTRATION in DATE) AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into recipient(
    R_Username, 
    National_ID,
    R_Pwd,
    R_First_Name, 
    R_Last_Name,
    R_Mobile_No,
    R_Address, 
    Zip_Code,
    R_Income,
    R_DATE_REGISTRATION) 
    values 
    (
    R_Username, 
    National_ID,
    R_Pwd,
    R_First_Name, 
    R_Last_Name,
    R_Mobile_No,
    R_Address, 
    Zip_Code,
    R_Income,
    R_DATE_REGISTRATION);
	dbms_output.put_line('Row inserted into RECIPIENT Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in RECIPIENT! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into RECIPIENT Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
  END INSERT_RECIPIENT_DETAILS;

PROCEDURE INSERT_FOOD_ALLOCATION_DETAILS(R_Username IN VARCHAR2,Status IN VARCHAR2,Claimed_Date IN DATE,DOD_ID IN NUMBER,V_ID IN NUMBER) 
AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into Food_Allocation(R_Username,Status,Claimed_Date,DOD_ID,V_ID) values (R_Username,Status,Claimed_Date,DOD_ID,V_ID);
	dbms_output.put_line('Row inserted into Food_Allocation Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in Food_Allocation! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into Food_Allocation Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
  END INSERT_FOOD_ALLOCATION_DETAILS;

end;
/