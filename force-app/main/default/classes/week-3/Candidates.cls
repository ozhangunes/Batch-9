public class Candidates {
    public string name;
    public string gender;
    public static string companyName;
    public static integer candidateCount = 0;

    public void printCandidate(){
        system.debug('Candidate name is ' + name + '('+ gender +')');
        system.debug('company name is ' + companyName);
        system.debug('=====END=====');
    }


}
