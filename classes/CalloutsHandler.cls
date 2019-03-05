public with sharing class CalloutsHandler {

    public static final String GET_METHOD = 'GET';

    private static final String AUTH = 'Authorization';

    private String endpoint;
    private String method;
    private String authorization;

    public CalloutsHandler(String endpoint, String method, String authorization) {
        this.endpoint = endpoint;
        this.method = method;
        this.authorization = authorization;
    }

    public HttpResponse sendCallout() {
        HttpResponse response;

        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(this.endpoint);
            request.setHeader(AUTH, this.authorization);
            request.setMethod(this.method);
            response = http.send(request);
        } catch(Exception e) {
            System.debug('>>> ' + e.getMessage());
            System.debug('>>> ' + e.getStackTraceString());
        }

        return response;
    }
}