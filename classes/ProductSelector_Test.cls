@isTest
private class ProductSelector_Test {

    @isTest static void testGetContactsToSendSurveyEmail() {
        Product2 testProduct = DataFactory.createProduct('Standard', 'EUR', 'SCDE', 'DE', false, null);
        PricebookEntry testPricebookEntry = DataFactory.createPricebookEntry(testProduct, 'EUR', 0);

        Test.startTest();
        List<PricebookEntry> products = ProductSelector.getProductWithRelations(testProduct.Id);
        System.assertEquals(1, products.size());
        Test.stopTest();
    }

}