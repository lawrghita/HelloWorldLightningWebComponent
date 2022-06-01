@isTest
private class AnimalLocatorTest {
    @isTest static void testGetLocator(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalLocatorResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result = AnimalLocator.getAnimalNameById(13);
        System.assertNotEquals(null,result, 'The callout returned a null response.');
        System.assertEquals(200,result.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),'The content type value is not expected.');
        System.assertEquals('chicken13', result.getBody());
    }
}


