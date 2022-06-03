@isTest global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        String[] myRomaniaParks = new String[]{'Romanesti','Craciun'};
        response_x.return_x = myRomaniaParks;
        // end
        response.put('response_x', response_x); 
   }
   
    
}

/*  
 * public Double doAdd(Double arg0,Double arg1) {
            calculatorServices.doAdd request_x = new calculatorServices.doAdd();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            calculatorServices.doAddResponse response_x;
            Map<String, calculatorServices.doAddResponse> response_map_x = new Map<String, calculatorServices.doAddResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doAdd',
              'http://calculator.services/',
              'doAddResponse',
              'calculatorServices.doAddResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
*/