-----------------------------ADD VOLUNTEER ID IN FOOD ALLOCATION TABLE-------------------------------
---UPDATE_VOLUNTEER_FOOD_ALLOCATION(P_ID,VOLUNTEER_ID);


BEGIN
  FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE('**********'||i||'******************');
        FOOD_DONATION_APP_ADMIN1.INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER.UPDATE_VOLUNTEER_FOOD_ALLOCATION
        (
        round(dbms_random.value(1,50),0),
        round(dbms_random.value(101,141),0)
        );
     END LOOP;
 
END;
/
