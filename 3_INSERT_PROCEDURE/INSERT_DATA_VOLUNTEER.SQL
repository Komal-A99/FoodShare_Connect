CREATE OR REPLACE 
PACKAGE INSERT_DATA_VOLUNTEER AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
PROCEDURE INSERT_DONATION_DETAILS(DO_ID in NUMBER, Cat_ID in NUMBER,Item_ID in NUMBER,Quantity in NUMBER, Total_Packets_Made in NUMBER);
END INSERT_DATA_VOLUNTEER;
/

create or replace PACKAGE BODY INSERT_DATA_VOLUNTEER
	AS

PROCEDURE INSERT_DONATION_DETAILS(DO_ID in NUMBER, Cat_ID in NUMBER,Item_ID in NUMBER,Quantity in NUMBER, Total_Packets_Made in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	INSERT INTO DONATION_DETAILS(DO_ID,Cat_ID,Item_ID,Quantity,Total_Packets_Made) VALUES (DO_ID,Cat_ID,Item_ID,Quantity,Total_Packets_Made);
	dbms_output.put_line('Row inserted into DONATION_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in DONATION_DETAILS table! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into DONATION_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_DONATION_DETAILS;

end;
/