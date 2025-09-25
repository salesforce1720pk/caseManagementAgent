public with sharing class CreateCaseClass {

    public class Request {
        @InvocableVariable(required=true)
        public String caseOrigin;

        @InvocableVariable(required=true)
        public String caseStatus;

        @InvocableVariable(required=true)
        public String caseSubject;
    }

    public class Response {
        @InvocableVariable
        public Id caseId;
    }

    @InvocableMethod(label='Create Case' description='Creates new Case records')
    public static List<Response> createCaseMethod(List<Request> requests) {
        List<Response> result = new List<Response>();
        List<Case> caseList = new List<Case>();

        for (Request req : requests) {
            if (req.caseOrigin != null && req.caseStatus != null && req.caseSubject != null) {
                Case c = new Case();
                c.Origin  = req.caseOrigin;
                c.Status  = req.caseStatus;
                c.Subject = req.caseSubject;
                caseList.add(c);
            }
        }

        if (!caseList.isEmpty()) {
            insert caseList;

            for (Case c : caseList) {
                Response r = new Response();
                r.caseId = c.Id;
                result.add(r);
            }
        }
        return result;
    }
}
