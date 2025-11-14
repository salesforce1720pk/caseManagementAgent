public with sharing class GetCaseDetailsClass {

    public class Request {
        @InvocableVariable(required=true)
        public Id caseId;
    }

    public class Response {
        @InvocableVariable
        public String caseNumber;

        @InvocableVariable
        public String caseOrigin;

        @InvocableVariable
        public String caseStatus;
    }

    @InvocableMethod(label='Get Case Details' description='Fetches Case details by Id')
    public static List<Response> getCaseMethod(List<Request> requests) {
        List<Response> responseList = new List<Response>();

        Set<Id> caseIds = new Set<Id>();
        for (Request req : requests) {
            if (req.caseId != null) {
                caseIds.add(req.caseId);
            }
        }

        Map<Id, Case> caseMap = new Map<Id, Case>(
            [SELECT Id, Status, Origin, CaseNumber FROM Case WHERE Id IN :caseIds]
        );

        for (Request req : requests) {
            Case c = caseMap.get(req.caseId);
            if (c != null) {
                Response r = new Response();
                r.caseNumber = c.CaseNumber;
                r.caseOrigin = c.Origin;
                r.caseStatus = c.Status;
                responseList.add(r);
            }
        }

        return responseList;
    }
}
