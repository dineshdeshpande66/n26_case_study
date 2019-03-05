@isTest
private class CalloutsHandler_Test {

    @isTest static void testCalloutsHandler() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DataFactory.LimitsCalloutSuccessMock());
        CalloutsHandler ch = new CalloutsHandler('test_endpoint', CalloutsHandler.GET_METHOD, 'test_authorization_string');
        HttpResponse resp = ch.sendCallout();
        System.assertNotEquals(null, resp);
        System.assertEquals(200, resp.getStatusCode());
        Test.stopTest();
    }

}