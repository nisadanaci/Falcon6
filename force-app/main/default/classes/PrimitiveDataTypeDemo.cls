public class PrimitiveDataTypeDemo {
    public void printBasicDataType(){
        // decimal value
        Decimal decValue = 27.01;
        System.debug('Decimal: ' + decValue);
        //long value has 'L' in it.
        Long longValue = 214748648L;
        System.debug('Long: ' + longValue);

        //datatype variableName  Value
        string batchName = 'Falcons 6';
        INTEGER totalCandidates = 120;
        Boolean isAdminCompleted = true;
        //print all of them using -> system.debug
        //using variable

        system.debug('batch name is ' + batchName);
        system.debug('total # of candidates: ' + totalCandidates);
        system.debug('admin completed? ' + isAdminCompleted);

        //creating variables with object data type 
        Object obj = 'This is a string';
        Object obj2 = 10;
        system.debug('object 1 : ' + obj);
       system.debug('object 2 : ' + obj2);

       Id id1 = '0015j00000ccro0AAA';
       system.debug('id ' + id1);
        //ID represents salesforce ID.
        
    }
}