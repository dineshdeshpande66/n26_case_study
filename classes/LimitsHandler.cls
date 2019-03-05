public with sharing class LimitsHandler {

    public static LimitsHandler.SingleEmailWrapper getSingleEmailLimits() {
        SingleEmailWrapper singleEmailLimitsResult;

        try {
            String endpoint = 'https://na85.salesforce.com/services/data/v44.0/limits';
            String method = CalloutsHandler.GET_METHOD;
            String authorization = 'Bearer ' + UserInfo.getSessionId();

            CalloutsHandler ch = new CalloutsHandler(endpoint, method, authorization);
            HttpResponse limitsResponse = ch.sendCallout();
        
            if (limitsResponse != null && limitsResponse.getStatusCode() == 200) {
                LimitsWrapper limitsResult = (LimitsWrapper)JSON.deserialize(limitsResponse.getBody(), LimitsHandler.LimitsWrapper.class);
                singleEmailLimitsResult = (limitsResult != null) ? limitsResult.SingleEmail : null;
            }
        } catch(Exception e) {
            System.debug('>>> ' + e.getMessage());
            System.debug('>>> ' + e.getStackTraceString());
        }

        return singleEmailLimitsResult;
    }

    public class LimitsWrapper {
        public SingleEmailWrapper SingleEmail;
    }
    
    public class SingleEmailWrapper {
        public Integer Max;
        public Integer Remaining;
    }
}