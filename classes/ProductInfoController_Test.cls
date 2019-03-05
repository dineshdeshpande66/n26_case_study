@isTest
private class ProductInfoController_Test {

    @isTest static void testGetProductInfo() {
        Product2 testProduct = DataFactory.createProduct('Standard', 'EUR', 'SCDE', 'DE', false, null);
        PricebookEntry testPricebookEntry = DataFactory.createPricebookEntry(testProduct, 'EUR', 0);

        Account acc = DataFactory.createAccount('test');
        Contact con = DataFactory.createContact(acc.Id, 'firstName1', 'lastName1', 'email1@email.test', 'en', Date.today() - 1, testProduct.Id);
        Case cas = DataFactory.createCase(acc.Id, con.Id, 'test');

        System.assertEquals(1, ProductInfoController.getProductInfo(cas.Id).size());
    }

}