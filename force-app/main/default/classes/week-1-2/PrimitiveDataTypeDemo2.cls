public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new date instance');

        Date newDate = Date.newInstance(1997, 8, 18);
        system.debug('newDate is ' + newDate);

        date newDate2 = date.newinstance(2022, 05, 15);
        system.debug('newDate 2 is ' + newDate2);

        date todayDate = date.today();
        system.debug('today\'s date is ' + todayDate );
    }

    public void printNewTime(){
        Time mytime = time.newInstance(18, 25, 15, 52);
        system.debug(mytime);

        Time mytime2 = time.newInstance(5, 15, 35, 5);
        system.debug(mytime2);
    }

    public void printNewDateTime(){
        // Date todayDate = date.today();
        // Time myTime = time.newInstance(18,25,15,52);

        // //1.New Datetime from date and time
        // Datetime dt1 = datetime.newInstance(todayDate, myTime);
        // System.debug('dt1 is ----> ' + dt1);

        // //2. datetime using YEAR, MOUNT, DAY
        // datetime dt2 = Datetime.newInstance(2025, 9 , 14, 15,19,25);
        // System.debug('dt2 is -----> ' + dt2);

        // //3. datetime with YEAR, MONTH, DAY, HOUR, MINUTE, SECOND   
        //  datetime dt3 = datetime.newInstance(2022, 5, 15, 17, 45, 6); //It will create pacific time (SF user's timezone). 
        //  system.debug('dt3 --> ' + dt3);// but it will print GMT. 
 
         //----------------Thursday Lesson------------------//
         //4. longtime
         long longTime = 1467854987654L;
         datetime dt4 = datetime.newInstance(longTime);
 
         long longTimeZero = 0;
         datetime dt41 = datetime.newInstance(longTimeZero);
 
         system.debug('dt 4 --> ' + dt4);
         system.debug('dt 41 --> ' + dt41);

         dateTime birthdate = dateTime.newInstance(1986, 7, 26, 13, 15 ,45);
         long longbirthdate = birthdate.getTime();
         
         system.debug (' long birht date = '+ longbirthdate);

         
    }
}
