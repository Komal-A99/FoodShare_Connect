------------------------------------------RANDOMLY ALLOCATE VOLUNTEER TO TO PICK UP THE DONATION--------------------

BEGIN
  FOR i IN 1..41 LOOP
        FOOD_DONATION_APP_ADMIN1.INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER.ALLOCATE_VOLUNTEER_TO_PICK_UP_DONATION(i,round(dbms_random.value(101,141),0));
     END LOOP;
 
END;
/
