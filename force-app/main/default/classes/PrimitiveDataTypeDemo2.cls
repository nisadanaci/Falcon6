public class PrimitiveDataTypeDemo2 {
    public void printNewDateTime(){
        //today's date
        date newDate = date.today();
        

        //new time
       time newTime = time.newInstance(9, 8, 0, 0);
       time tryTime = time.newInstance(23, 23, 23,23);
        
        //1. create new datetime from DATE and TIME
        datetime dt1 = datetime.newInstance(newDate, newTime);
        system.debug('dt1'  + dt1);

        //2. create datetime using YEAR, MONTH, DAY. => Time will be midnight (00000).
        datetime dt2 = datetime.newInstance(2025, 1, 9);
        system.debug('dt2 is ' + dt2);
        //3. datetime from YEAR, MONTH, DAY, HOUR, MINUTE, SECOND.
        datetime dt3 = datetime.newInstance(2022, 02, 20, 15, 15, 15);
        system.debug('dt3 is '+ dt3);

        //4. Current datetime???
        datetime currentDT = datetime.now();
        //current user's timezone is considered.
        //when it prints, it prints in GMT
        system.debug('current DT : ' + currentDT);

        //5. create GMT datetime using YEAR, MONTH, DAY, HOUR, MINUTE,SECOND.
        Datetime dt5 = DateTime.newInstanceGmt(1998, 1, 28, 18, 0, 0);
        system.debug('dt5 = ' + dt5);

        DateTime dt6 = Datetime.newInstance(0); 
        system.debug('dt6 = '+ dt6);
        //6 longTime
        DateTime dt6_1 = Datetime.newInstance(5000L); 
        system.debug('dt6_1 = '+ dt6_1);

        
        Long longTime = 1236598653265L;
        DateTime dt7 = datetime.newInstance(longTime);
        system.debug('dt7 = ' + dt7);



    }




    public void printNewTime(){
        Time myTime = Time.newInstance(18, 20, 2, 30);
        Time meTime = Time.newInstance(15, 15, 2, 20);
        system.debug('Time is: ' + myTime);
        system.debug('Time is: ' + meTime);

    }



    public void printNewDate(){
        system.debug('create new Date instance');

        //.newInstance(year, month, day)
        Date newDate = Date.newInstance(1995, 5, 15);
        system.debug('new date: ' + newDate);
        
        
        Date newDate2 = Date.newInstance(2022, 02, 02);
        system.debug('new date2 : ' + newDate2); 

        //today's date
        Date todayDate = date.today();
        system.debug('today date is ' + todayDate);

    }
}
