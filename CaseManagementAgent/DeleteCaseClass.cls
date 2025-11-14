public with sharing class DeleteCaseClass {

    public class Request {
        @InvocableVariable(required=true)
        public Id caseId;
    }

    public class Response {
        @InvocableVariable
        public Id deletedCaseId;

        @InvocableVariable
        public Boolean isDeleted;

        @InvocableVariable
        public String message;
    }

    public static List<Response> deleteCaseMethod(List<Request> requests) {
        List<Response> responses = new List<Response>();
        Set<Id> caseIds = new Set<Id>();

        for (Request r : requests) {
            if (r.caseId != null) {
                caseIds.add(r.caseId);
            }
        }

        if (caseIds.isEmpty()) {
            return responses;
        }

        List<Case> casesToDelete = [
            SELECT Id, CaseNumber FROM Case WHERE Id IN :caseIds
        ];

        try {
            delete casesToDelete;

            for (Case c : casesToDelete) {
                Response res = new Response();
                res.deletedCaseId = c.Id;
                res.isDeleted = true;
                res.message = 'Case ' + c.CaseNumber + ' deleted successfully.';
                responses.add(res);
            }
        } catch (DmlException e) {
            for (Id failedId : caseIds) {
                Response res = new Response();
                res.deletedCaseId = failedId;
                res.isDeleted = false;
                res.message = 'Delete failed: ' + e.getMessage();
                responses.add(res);
            }
        }

        return responses;
    }
}
