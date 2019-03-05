public class ProductInfoController {

    @AuraEnabled
    public static List<PricebookEntry> getProductInfo(Id caseId) {
        Case currentCase = CaseSelector.getCaseById(caseId);
        if (currentCase.Contact == null || String.isBlank(currentCase.Contact.Product__c)) {
            return null;
        }
        return ProductSelector.getProductWithRelations(currentCase.Contact.Product__c);
    }

}