CREATE OR REPLACE 
PACKAGE INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  PROCEDURE INSERT_LOCATION_DETAILS(ZIP_CODE in VARCHAR2,CITY_NAME in VARCHAR2, STATE_NAME in VARCHAR2);
  PROCEDURE INSERT_VOLUNTEER_DETAILS(V_FIRST_NAME in VARCHAR2, V_LAST_NAME in VARCHAR2,V_USERNAME in VARCHAR2, V_PWD in VARCHAR2,V_MOBILE_NO in VARCHAR2,V_ADDRESS in VARCHAR2, ZIP_CODE in VARCHAR2,V_ACTIVE in NUMBER,V_AVAILABILITY in VARCHAR2,V_DATE_REGISTRATION in DATE);
  PROCEDURE INSERT_FOOD_CATEGORY_DETAILS(CATEGORY_NAME in VARCHAR2,CATEGORY_DESC in VARCHAR2);
  PROCEDURE INSERT_FOOD_ITEMS_DETAILS(FOOD_ITEM in VARCHAR2,Cat_ID in NUMBER);
  PROCEDURE UPDATE_VOLUNTEER_FOOD_ALLOCATION (P_ID IN NUMBER, VOLUNTEER_ID IN NUMBER);
  PROCEDURE ALLOCATE_VOLUNTEER_TO_PICK_UP_DONATION (DONATION_ID IN NUMBER, VOLUNTEER_ID IN NUMBER);
  PROCEDURE update_r_approval_status(recp_id IN NUMBER);
END INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER;
/


create or replace PACKAGE BODY INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER
	AS
    
    PROCEDURE update_r_approval_status(recp_id in NUMBER) AS
  BEGIN
	dbms_output.put_line('------------------------------'|| recp_id ||'----------------------------');
	update recipient set R_APPROVAL_STATUS = 1 where R_ID = recp_id;
    commit;
	dbms_output.put_line('Row updated into recipient Table');
	dbms_output.put_line('----------------------------------------------------------');	
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in recipient! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into recipient Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
END update_r_approval_status;


    
  PROCEDURE INSERT_LOCATION_DETAILS(ZIP_CODE in VARCHAR2,CITY_NAME in VARCHAR2, STATE_NAME in VARCHAR2) AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into LOCATION(ZIP_CODE,CITY_NAME, STATE_NAME) values (ZIP_CODE,CITY_NAME,STATE_NAME);
	dbms_output.put_line('Row inserted into LOCATION Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in LOCATION! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into LOCATION Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
END INSERT_LOCATION_DETAILS;

----------------------------- TO ALLOCATE VOLUNTEER TO PICK UP THE DONATION-------------------------------
PROCEDURE ALLOCATE_VOLUNTEER_TO_PICK_UP_DONATION (DONATION_ID IN NUMBER, VOLUNTEER_ID IN NUMBER) AS
BEGIN
  UPDATE DONATION SET V_ID=VOLUNTEER_ID WHERE DO_ID = DONATION_ID;
  commit;
  dbms_output.put_line('----------------------RECORD WITH DONATION ID ' || DONATION_ID ||' UPDATED------------------------------------');
  exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in DONATION! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into DONATION Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
END ALLOCATE_VOLUNTEER_TO_PICK_UP_DONATION;

-----------------------------PROCEDURE TO ADD VOLUNTEER ID IN FOOD ALLOCATION TABLE-------------------------------
PROCEDURE UPDATE_VOLUNTEER_FOOD_ALLOCATION (P_ID IN NUMBER, VOLUNTEER_ID IN NUMBER) AS
BEGIN
  UPDATE FOOD_ALLOCATION SET V_ID=VOLUNTEER_ID WHERE PACKET_ID = P_ID;
  UPDATE FOOD_ALLOCATION SET STATUS='DISTRIBUTED' WHERE PACKET_ID = P_ID;
  commit;
  dbms_output.put_line('----------------------RECORD WITH PACKET ID ' || P_ID ||' UPDATED------------------------------------');
  exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in FOOD ALLOCATION! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into FOOD ALLOCATION Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
END UPDATE_VOLUNTEER_FOOD_ALLOCATION;

PROCEDURE INSERT_VOLUNTEER_DETAILS(V_FIRST_NAME in VARCHAR2, V_LAST_NAME in VARCHAR2,V_USERNAME in VARCHAR2, V_PWD in VARCHAR2,V_MOBILE_NO in VARCHAR2,V_ADDRESS in VARCHAR2, ZIP_CODE in VARCHAR2,V_ACTIVE in NUMBER,V_AVAILABILITY in VARCHAR2,V_DATE_REGISTRATION in DATE) AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	insert into VOLUNTEER(
    V_FIRST_NAME, 
    V_LAST_NAME,
    V_USERNAME, 
    V_PWD,
    V_MOBILE_NO,
    V_ADDRESS, 
    ZIP_CODE,
    V_ACTIVE,
    V_AVAILABILITY,  
    V_DATE_REGISTRATION) 
    values 
    (
    V_FIRST_NAME, 
    V_LAST_NAME,
    V_USERNAME, 
    V_PWD,
    V_MOBILE_NO,
    V_ADDRESS, 
    ZIP_CODE,
    V_ACTIVE,V_AVAILABILITY, 
    V_DATE_REGISTRATION);
	dbms_output.put_line('----------------------Row inserted into VOLUNTEER Table-----------------');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in VOLUNTEER! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into VOLUNTEER Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
  END INSERT_VOLUNTEER_DETAILS;
  
  PROCEDURE INSERT_FOOD_CATEGORY_DETAILS(CATEGORY_NAME in VARCHAR2,CATEGORY_DESC in VARCHAR2) AS
  BEGIN
	dbms_output.put_line('----------------------------------------------------------');
    insert into Food_Category(CATEGORY_NAME,CATEGORY_DESC) values (CATEGORY_NAME,CATEGORY_DESC);
	dbms_output.put_line('Row inserted into Food_Category Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in Food_Category! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into Food_Category Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
  END INSERT_FOOD_CATEGORY_DETAILS;
  
  PROCEDURE INSERT_FOOD_ITEMS_DETAILS(FOOD_ITEM in VARCHAR2,Cat_ID in NUMBER)
	AS
	BEGIN
	dbms_output.put_line('----------------------------------------------------------');
	INSERT INTO FOOD_ITEM_DETAILS(FOOD_ITEM,Cat_ID) VALUES (FOOD_ITEM,Cat_ID);
	dbms_output.put_line('Row inserted into FOOD_ITEM_DETAILS Table');
	dbms_output.put_line('----------------------------------------------------------');
	commit;
	exception
		when dup_val_on_index then
		dbms_output.put_line('Duplicate Value Found in FOOD_ITEM_DETAILS table! Insert Different Value');
		when others then
		dbms_output.put_line('Error while inserting data into FOOD_ITEM_DETAILS Table');
		rollback;
			dbms_output.put_line('The error encountered is: ');
			dbms_output.put_line(dbms_utility.format_error_stack);
			dbms_output.put_line('----------------------------------------------------------');
	end INSERT_FOOD_ITEMS_DETAILS;   
end;
/