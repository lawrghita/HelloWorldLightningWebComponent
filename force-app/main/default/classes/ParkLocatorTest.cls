@isTest
@isTest private class ParkLocatorTest {
    @isTest static void testCallout() {              
    System.Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String countryTest = 'Romania';
        String[] myRomaniaParks = new String[]{'Romanesti','Craciun'};
        String[] result = ParkLocator.country(countryTest);
        System.assertEquals(myRomaniaParks, result);
    }
}
