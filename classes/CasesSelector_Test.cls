@isTest
private class CasesSelector_Test {

    @isTest static void testGetCaseById() {
        Account acc = DataFactory.createAccount('test');
        Contact con = DataFactory.createContact(acc.Id, 'firstName1', 'lastName1', 'email1@email.test', 'en', Date.today() - 1);
        Case cas = DataFactory.createCase(acc.Id, con.Id, 'test');

        Test.startTest();
        Case c = CasesSelector.getCaseById(cas.Id);

        System.assertEquals(c.Id, cas.Id);
        Test.stopTest();
    }
}