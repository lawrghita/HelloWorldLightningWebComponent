@isTest
private class AnimalLocatorTest {
        @isTest static void testGetLocatorNo200(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalLocatorResource');
        mock.setStatusCode(2);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.Test.setMock(HttpCalloutMock.class, mock);
        String result = AnimalLocator.getAnimalNameById(0);
        System.assertEquals('', result,'result test no connection');
    }
    
    @isTest static void testGetLocator(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalLocatorResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.Test.setMock(HttpCalloutMock.class, mock);
        String result = AnimalLocator.getAnimalNameById(13);
        System.assertEquals('chicken13', result,'result test 13');
    }
    @isTest static void testGetLocatorEmpty(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetEmptyAnimalLocatorResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.Test.setMock(HttpCalloutMock.class, mock);
        String result = AnimalLocator.getAnimalNameById(2);
        System.assertEquals('', result,'result test empty');
    }
    @isTest static void testPostLocator(){
        // Set mock callout class to be the created AnimalsHttpCalloutMock
        System.Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        HttpResponse response = AnimalLocator.makePostLocator();
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json', 'app/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animal":{"id":13,"name":"chicken13","eats":"chicken food13","says":"cluck cluck13"}';
        System.assertEquals(expectedValue, actualValue,'as expected');
        System.assertEquals(200, response.getStatusCode(),'200');
    } 
 
}