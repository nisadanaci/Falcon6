// create a method
public class StringDemoClass {
    public void stringMethod1(){
        //Method variable
        string sessionDescription = 'learning string\'s methods in apex language.';

        //1. length
        integer lengthOfStr = sessionDescription.length();
        system.debug('length of string is = ' + lengthOfStr);
       
       
       
      //2. upper case
        string sessionDescriptionInCaps = sessionDescription.toUpperCase();
        system.debug('in caps = ' + sessionDescriptionInCaps);
        system.debug('original string = ' + sessionDescription);

        //3. contains 'apex'
        boolean containsApex = sessionDescription.contains('apex');
        system.debug('has apex? ' + containsApex);

        //3.a check salesforce
        boolean containsSalesforce = sessionDescription.contains('salesforce');
        system.debug('has salesforce? ' + containsSalesforce);

        //3.b check Apex
        boolean containsAPEX2 = sessionDescription.containsIgnoreCase('APEX');
        system.debug('has APEX? ' + containsAPEX2);

        //4. 
        string apexx = 'apex';
        string ap = 'APEXX';
        // equals check if two strings are same or not.
        //if same returns true.
        //string1.equals(string2)
        boolean apexCheck = apexx.equals(ap);
        system.debug('apex check ' + apexCheck);
    }
}
