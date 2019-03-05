trigger TaskTrigger on Task (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    if (Trigger.isAfter && Trigger.isInsert) {
        TaskHandler.updateContactSurveyDate(Trigger.new);
    }

}