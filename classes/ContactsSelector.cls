public inherited sharing class ContactsSelector {

    public ContactsSelector() {}

    public List<Contact> getContactsToSendSurveyEmail() {
        return [
            SELECT
                Id,
                FirstName,
                LastName,
                Email,
                Language__c,
                Survey_Date__c,
                AccountId
            FROM
                Contact
            WHERE
                Survey_Date__c < TODAY
        ];
    }

}