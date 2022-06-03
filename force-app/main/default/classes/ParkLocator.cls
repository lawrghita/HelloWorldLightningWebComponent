public with sharing class ParkLocator {
     public static String[] country(String countryCheck){
         String[] parks = new String[]{};
             ParkService.ParksImplPort parksServ = new  ParkService.ParksImplPort();
             return parksServ.byCountry(countryCheck);
    }
}