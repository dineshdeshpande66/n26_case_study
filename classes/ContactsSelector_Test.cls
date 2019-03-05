@isTest
private class ContactsSelector_Test {

    @isTest static void testGetContactsToSendSurveyEmail() {
        Account acc = DataFactory.createAccount('test');
        DataFactory.createContact(acc.Id, 'firstName1', 'lastName1', 'email1@email.test', 'en', Date.today() - 1);
        DataFactory.createContact(acc.Id, 'firstName2', 'lastName2', 'email2@email.test', 'de', null);

        Test.startTest();
        ContactsSelector cs = new ContactsSelector();
        List<Contact> selectedContacts = cs.getContactsToSendSurveyEmail();
        System.assertNotEquals(null, selectedContacts);
        System.assertEquals(1, selectedContacts.size());
        System.assertEquals('email1@email.test', selectedContacts[0].Email);
        Test.stopTest();
    }

}