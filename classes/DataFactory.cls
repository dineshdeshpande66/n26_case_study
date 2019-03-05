@isTest
public class DataFactory {

    public static Account createAccount(String accName) {
        Account testAccount = new Account(
            Name = accName
        );
        insert testAccount;
        return testAccount;
    }

    public static Contact createContact(Id accId, String firstName, String lastName, String email, String language, Date surveyDate) {
        return createContact(accId, firstName, lastName, email, language, surveyDate, null);
    }

    public static Contact createContact(Id accId, String firstName, String lastName, String email, String language, Date surveyDate, Id productId) {
        Contact testContact = new Contact(
            AccountId = accId,
            FirstName = firstName,
            LastName = lastName,
            Email = email,
            Language__c = language,
            Survey_Date__c = surveyDate,
            Product__c = productId
        );
        insert testContact;
        return testContact;
    }

    public static Case createCase(Id accId, String conId, String subject) {
        Case testCase = new Case(
            AccountId = accId,
            ContactId = conId,
            Subject = subject
        );
        insert testCase;
        return testCase;
    }

    public static Task createTask(Id whatId, Id whoId, String taskSubtype) {
        Task testTask = new Task(
            WhatId = whatId,
            WhoId = whoId,
            TaskSubtype = taskSubtype
        );
        insert testTask;
        return testTask;
    }

    public static Product2 createProduct(String name, String currencyIsoCode, String productCode, String country, Boolean percent, Id productId) {
        Product2 testProduct = new Product2(
            IsActive = true,
            Name = name,
            CurrencyIsoCode = currencyIsoCode,
            ProductCode = productCode,
            Country__c = country,
            Percent__c = percent,
            Product__c = productId
        );
        insert testProduct;
        return testProduct;
    }

    public static PricebookEntry createPricebookEntry(Product2 product, String currencyIsoCode, Decimal unitPrice) {
        PricebookEntry testPricebookEntry = new PricebookEntry(
            IsActive = true,
            Product2Id = product.Id,
            CurrencyIsoCode = currencyIsoCode,
            Pricebook2Id = Test.getStandardPricebookId(),
            UnitPrice = unitPrice
        );
        insert testPricebookEntry;
        return testPricebookEntry;
    }

    public class LimitsCalloutSuccessMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(''
                +'{ '
                +'    "SingleEmail" : { '
                +'        "Max" : "5000", '
                +'        "Remaining" : "5000" '
                +'    } '
                +'}'
            );
            res.setStatusCode(200);
            return res;
        }
    }

    public class LimitsCalloutFailMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('');
            res.setStatusCode(501);
            return res;
        }
    }

}