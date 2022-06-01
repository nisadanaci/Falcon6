public class Candidates {
    public string name;
    public string gender;
    public static string companyName;

    public void printCandidate(){
        system.debug('Candidate name is ' + Name + '(' + Gender + ')');

        //STATIC members in NOn-static methods ___> ALLOWED
        system.debug('Company name is ' + companyName);
    }

    public static void printCandidateInfoSt() {
        system.debug('company name is ' + companyName);
        //Non- static members inside static methods => not allowed
        //system.debug('name = ' + name); //VALID??? NO.
    }
    
}
