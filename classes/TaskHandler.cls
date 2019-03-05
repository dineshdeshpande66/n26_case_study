public with sharing class TaskHandler {

    public static void updateContactSurveyDate(List<Task> emailMessages) {
        List<Contact> contactsToUpdate = new List<Contact>();
        for (Task emailMessage : emailMessages) {
            System.debug(emailMessage.WhoId.getSObjectType() == Contact.sObjectType);
            if (emailMessage.TaskSubtype == 'Email' && emailMessage.WhoId.getSObjectType() == Contact.sObjectType) {
                contactsToUpdate.add(new Contact(Id = emailMessage.WhoId, Survey_Date__c = null));
            }
        }
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
    }

}