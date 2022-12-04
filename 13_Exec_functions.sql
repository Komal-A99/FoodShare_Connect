
------------------------------------------RANDOMLY ALLOCATE VOLUNTEER TO TO PICK UP THE DONATION--------------------
DECLARE
fun_result number;
BEGIN
 FOR i IN 101..146 LOOP
       dbms_output.put_line('***************'|| i || '********************');
       fun_result:= FOOD_DONATION_APP_ADMIN1.VERIFY_INCOME(i);
       if(fun_result = 1)
       then
         FOOD_DONATION_APP_ADMIN1.INSERT_DATA_PROCEDURES_FOOD_PANTRY_MANAGER.update_r_approval_status(i);
        else 
        dbms_output.put_line('Income is more than 28000. NOT APPROVED!!!');
end if;
 END LOOP;  
             EXCEPTION 
          when no_data_found then
           dbms_output.put_line('****************data does not exist**************'); 
        when others
                then
                dbms_output.put_line('********************Something went wrong********************');
                dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('-----------------------------------------------------------------------------------------------------------');


END;
/

