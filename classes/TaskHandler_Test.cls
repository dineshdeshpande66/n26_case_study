@isTest
private class TaskHandler_Test {

    @isTest static void testUpdateContactSurveyDate() {
        Account acc = DataFactory.createAccount('test');
        Contact con = DataFactory.createContact(acc.Id, 'firstName1', 'lastName1', 'email1@email.test', 'en', Date.today() - 1);

        Test.startTest();
        DataFactory.createTask(acc.Id, con.Id, 'Email');
        System.assertEquals(null, [SELECT Survey_Date__c FROM Contact].Survey_Date__c);
        Test.stopTest();
    }

}