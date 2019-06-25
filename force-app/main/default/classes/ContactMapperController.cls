public inherited sharing class ContactMapperController {
    public ContactMapperController() {}

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id,MailingCity,MailingCountry,MailingPostalCode,MailingState,MailingStreet,FirstName,LastName,Email,Phone 
                FROM Contact
                WHERE MailingPostalCode != null
                LIMIT 10];
    }
}
