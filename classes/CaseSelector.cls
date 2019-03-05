public with sharing class CaseSelector {
    
    public CaseSelector() {}

    public static Case getCaseById(Id caseId) {
        return [
            SELECT
                Id,
                ContactId,
                Contact.Product__c
            FROM
                Case
            WHERE
                Id = :caseId
        ];
    }

}