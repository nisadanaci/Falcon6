public class MapDemoClass {
    //returns monthName from month number
    //example 
    public static string retrieveMonth(integer m){
        string monthName = '';
        map<integer, string> monthMap = new map<integer, string>();
        monthMap.put(1, 'January');
        monthMap.put(2, 'February');
        monthMap.put(3, 'March');
        monthMap.put(4, 'April');

        monthMap.put(5, 'May');
        monthMap.put(6, 'June');
        monthMap.put(7, 'July');
        monthMap.put(8, 'August');

        monthMap.put(9, 'September');
        monthMap.put(10, 'October');
        monthMap.put(11, 'Novamber');
        monthMap.put(12, 'December');

        //Before returning we want to check if Key exist in map or not.

        Boolean keyExists = monthMap.containsKey(m);
        if (keyExists) {
          monthName = monthMap.get(m);  
        } else {
            monthName = 'No SUCH month exists. Please behave!';

        }

        //monthName = monthMap.get(m);
        return monthName;
    }
}
