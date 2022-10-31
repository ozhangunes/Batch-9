Map<String, Country_Code__c> cc = Country_Code__c.getAll();
system.debug('Country Code map --> ' + cc);

for(String eachCountry : cc.keyset()){
    Country_Code__c eachCC = cc.get(eachCountry);
    string isoCode = eachCC.iso_Code__c;
    System.debug(isoCode);
    system.debug(eachCountry);
}

//if we want to get iso code for Canada
country_code__c can = Country_code__c.getInstance('Canada');
system.debug('Canada iso code is ' + can.iso_Code__c);

Map<string, Email_Domain__mdt> em = Email_Domain__mdt.getAll();
System.debug(em.get('Gmail').Domain__c);
