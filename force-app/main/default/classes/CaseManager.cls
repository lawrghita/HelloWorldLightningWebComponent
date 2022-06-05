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
        RestResponse response = RestContext.response;
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
}