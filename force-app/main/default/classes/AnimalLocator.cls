public class AnimalLocator{
    public static String getAnimalNameById(Integer animalID){
        String name;
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
        }else{
            return '';
        }
    }
}