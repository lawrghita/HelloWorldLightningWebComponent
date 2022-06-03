public class AnimalLocator{
    public static String getAnimalNameById(Integer animalID){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalID);
        request.setMethod('GET');
        request.getBody();
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        System.debug(response.getStatus());
        if (response.getStatusCode()==200) {
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>) result.get('animal');
            return animal.get('name').toString();        
        }
        return '';
    }
    public static HttpResponse makePostLocator() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/13');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"chicken13"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }   
    
}