@isTest
private class LimitsHandler_Test {

    @isTest static void testGetSingleEmailLimits() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new DataFactory.LimitsCalloutSuccessMock());
        LimitsHandler.SingleEmailWrapper limits = LimitsHandler.getSingleEmailLimits();
        System.assertNotEquals(null, limits);
        System.assertEquals(5000, limits.Max);
        System.assertEquals(5000, limits.Remaining);
        Test.stopTest();
    }

}