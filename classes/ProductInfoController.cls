public with sharing class ProductInfoController {

    @AuraEnabled
    public static List<PricebookEntry> getProductInfo(Id caseId) {
        Case currentCase = CasesSelector.getCaseById(caseId);
        if (currentCase.Contact == null || String.isBlank(currentCase.Contact.Product__c)) {
            return null;
        }
        return ProductsSelector.getProductWithRelations(currentCase.Contact.Product__c);
    }

}