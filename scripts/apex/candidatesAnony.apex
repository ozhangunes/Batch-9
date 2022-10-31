system.debug('START number of candidates = ' + Candidates.candidateCount);
Candidates.companyName = 'Softinnovas';//static members belongs to CLASS

Candidates c1 = new Candidates();
Candidates.candidateCount++;
c1.name = 'Jerry';
c1.gender = 'Male';
c1.printCandidate();


Candidates c2 = new Candidates();
Candidates.candidateCount++;
c2.name = 'Elaine';
c2.gender = 'Female';
c2.printCandidate();

Candidates c3 = new Candidates();
Candidates.candidateCount++;
c3.name = 'George';
c3.gender = 'Male';
c3.printCandidate();

Candidates.companyName = 'With sharing';

Candidates c4 = new Candidates();
Candidates.candidateCount++;
c4.name = 'Newman';
c4.gender = 'Male';
c4.printCandidate();

Candidates c5 = new Candidates();
Candidates.candidateCount++;
c5.name = 'Kramer';
c5.gender = 'Male';
c5.printCandidate();

c3.printCandidate();
c2.printCandidate();
c1.printCandidate();

system.debug('END number of candidates = ' + Candidates.candidateCount);