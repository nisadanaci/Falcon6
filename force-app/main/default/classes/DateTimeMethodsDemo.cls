public class DateTimeMethodsDemo {
    //1. Create one method calculateAgeinMonths()
    public void calculateageInMonths(){
        //1.1 Calculate age in months
        //(we need two days- birthday and today's date)
        //birthdate variable
        Date birthdate = date.newInstance(1988, 4, 27);
        //today date
        Date todayDate = date.today();
        //claculate month difference in between two dates.
        integer ageInMonths = birthdate.monthsBetween(todayDate);
        system.debug('age in months = ' + ageInMonths);

    }

    public void calculateAgeInDays(){
        Date birthdate = date.newInstance(1988, 4, 27); 
        Date todayDate = date.today();  
        integer ageInDays = birthdate.daysBetween(todayDate);
        system.debug('age in days = ' + ageInDays);
    }

    public void printSubscriptionEndDate(){
        date subscriptionStartDate = date.today();
        date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('subscription End date = ' + subscriptionEndDate);

        //3.1.1 Also, print 'year' and 'month' of end date
        Integer endDateYear = subscriptionEndDate.year();
        system.debug('subscription end date year is ' + endDateYear);

        Integer endDateMonth = subscriptionEndDate.month();
        System.debug('subscription end date month is ' + endDateMonth);     
    }
    public void printOfferEndDateTime(){
        Datetime dtNow = datetime.now();
        Datetime dtOfferEnd = dtNow.addHours(51);
        system.debug('Offer will end of ' + dtOfferEnd);

        date offerEndDate = dtOfferEnd.date();
        system.debug('offer end date is ' + offerEndDate);
    }

     //method name: leapYearcheck
     //parameter:1 : date
     //returnType: boolean
    public boolean leapYearCheck(date dt){
        integer year = dt.year();
        boolean lp = date.isLeapYear(year);
        return lp;
    }
}


