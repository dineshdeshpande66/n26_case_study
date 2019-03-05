public with sharing class ProductSelector {

    public ProductSelector() {}

    public static List<PricebookEntry> getProductWithRelations(Id productId) {
        return [
            SELECT
                Id,
                Name,
                UnitPrice,
                CurrencyIsoCode,
                Product2Id,
                Product2.Name,
                Product2.Percent__c,
                Product2.Product__c
            FROM
                PricebookEntry
            WHERE
                Product2Id = :productId OR Product2.Product__c = :productId
            ORDER BY Product2.Product__c ASC
        ];
    }

}