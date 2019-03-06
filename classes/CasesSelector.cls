public inherited sharing class CasesSelector {
    
    public CasesSelector() {}

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