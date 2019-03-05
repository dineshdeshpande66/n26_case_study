@isTest
private class SendSurveysBatch_Test {

    @isTest static void testBatch() {
        Account acc = DataFactory.createAccount('test');
        Contact con1 = DataFactory.createContact(acc.Id, 'firstName1', 'lastName1', 'email1@email.test', 'en', Date.today() - 1);
        Contact con2 = DataFactory.createContact(acc.Id, 'firstName2', 'lastName2', 'email2@email.test', 'en', null);
        Contact con3 = DataFactory.createContact(acc.Id, 'firstName3', 'lastName3', null, 'en', Date.today() - 1);

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DataFactory.LimitsCalloutSuccessMock());
        Database.executeBatch(new SendSurveysBatch(), SendEmailHandler.EMAILS_PER_BATCH);
        Test.stopTest();

        System.assertEquals(null, [SELECT Survey_Date__c FROM Contact WHERE Id = :con1.Id].Survey_Date__c);
        System.assertEquals(1, [SELECT Id FROM Task WHERE WhoId = :con1.Id].size());

        System.assertEquals(0, [SELECT Id FROM Task WHERE WhoId = :con2.Id].size());

        System.assertNotEquals(null, [SELECT Survey_Date__c FROM Contact WHERE Id = :con3.Id].Survey_Date__c);
        System.assertEquals(0, [SELECT Id FROM Task WHERE WhoId = :con3.Id].size());
    }

}