//expose this class as a REST resource, can give acces to org inside data from outside
//services/apexrest
@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {    
    @HTTPGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        // grab the case ID from the end of the URL
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result = [SELECT CaseNumber,Subject,Status,Origin, Priority FROM Case WHERE Id= :caseId];
        if (result != null) return result; else return null;
		        
    }
    @HttpDelete
    global static Boolean deleteCaseById(){
        RestRequest request = RestContext.request;
        // grab the case ID from the end of the URL
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
         System.debug(caseId);
		 System.debug(request);
        try {
            Case result = [SELECT Id FROM Case WHERE Id= :caseId];
            return true;
        	}catch(System.QueryException e){
                System.debug('Error2'+e); return false;
           	}
    }
    @HttpPost
    global static ID createCase(String subject, String status, String origin, String priority){
        Case thisCase= new Case(Subject = subject, Status = status, Origin = origin, Priority = priority); 
		insert thisCase;        
        return thisCase.Id;
    }
    @HttpPut
    global static ID upsertCase(String subject, String status, String origin, String priority, String ID){
        Case thisCase= new Case(Id = id, Subject = subject, Status = status, Origin = origin, Priority = priority); 
        //update or insert:
		upsert thisCase;        
        return thisCase.Id;
    }
    @HttpPatch
    global static ID updateCaseFields(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        Map<String, Object> params =(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.tostring());
        
        for (String fieldName:params.keySet()){
            
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
    	return thisCase.Id;    
    }
    
}