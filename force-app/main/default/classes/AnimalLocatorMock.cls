@isTest
global class AnimalsLocatorMock implements System.HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":13,"name":"chicken13","eats":"chicken food13","says":"cluck cluck13"}');
        response.setStatusCode(200);
        return response;
    }
}