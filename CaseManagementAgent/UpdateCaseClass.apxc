public with sharing class UpdateCaseClass {

    public class Request {
        @InvocableVariable(required=true)
        public Id caseId;

        @InvocableVariable
        public String caseOrigin;

        @InvocableVariable
        public String caseStatus;
    }

    public class Response {
        @InvocableVariable
        public String caseNumber;
    }

   
    public static List<Response> updateCaseMethod(List<Request> requests) {
        List<Response> responses = new List<Response>();

        Set<Id> caseIds = new Set<Id>();
        for (Request r : requests) {
            if (r.caseId != null) {
                caseIds.add(r.caseId);
            }
        }

        Map<Id, Case> caseMap = new Map<Id, Case>(
            [SELECT Id, Status, Origin, CaseNumber FROM Case WHERE Id IN :caseIds]
        );

        List<Case> casesToUpdate = new List<Case>();

        for (Request r : requests) {
            Case c = caseMap.get(r.caseId);
            if (c != null) {
                if (r.caseOrigin != null) {
                    c.Origin = r.caseOrigin;
                }
                if (r.caseStatus != null) {
                    c.Status = r.caseStatus;
                }
                casesToUpdate.add(c);
            }
        }

        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;

            for (Case c : casesToUpdate) {
                Response res = new Response();
                res.caseNumber = c.CaseNumber;
                responses.add(res);
            }
        }

        return responses;
    }
}
