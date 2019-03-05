public with sharing class SendSurveysBatch implements Database.Batchable<Contact>, Schedulable, Database.AllowsCallouts {

    private List<Contact> contactsToUpdate;

    public SendSurveysBatch() {
        this.contactsToUpdate = new List<Contact>();
    }

    //start of the scheduler part
    public void execute(SchedulableContext context) {
        Database.executeBatch(this, SendEmailHandler.EMAILS_PER_BATCH); //going to send up to 100 emails in a single batch
    }
    //end of the scheduler part

    //start of the batch part
    public List<Contact> start(Database.BatchableContext BC) {
        return new ContactsSelector().getContactsToSendSurveyEmail();
    }

    public void execute(Database.BatchableContext BC, List<Contact> contacts) {
        LimitsHandler.SingleEmailWrapper singleEmailLimits = LimitsHandler.getSingleEmailLimits();
        Integer emailCount = (singleEmailLimits != null && singleEmailLimits.Remaining < contacts.size()) ? singleEmailLimits.Remaining : contacts.size();

        SendEmailHandler emailHandler = new SendEmailHandler(emailCount);
        for (Contact surveyContact : Contacts) {
            emailHandler.prepareSurveyEmail(surveyContact);
        }

        List<Messaging.SendEmailResult> sendEmailResults = emailHandler.sendEmails();
    }

    public void finish(Database.BatchableContext BC) {}
    //end of the batch part

}