@isTest
private class OASDefaultApiTest {
    /**
     * adds a customer record
     *
     * Adds a customer record
     */
    @isTest
    private static void addCustomerTest() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setStatus('OK');
        Test.setMock(HttpCalloutMock.class, new OASResponseMock(res));

        Map<String, Object> params = new Map<String, Object>{
            'customer' => ''
        };

        OASClient client;
        OASDefaultApi api;
        String js = '';

        api = new OASDefaultApi(new OASClient());

        api.addCustomer(params);
    }

    /**
     * 
     *
     * 
     */
    @isTest
    private static void getCustomerTest() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setStatus('OK');
        Test.setMock(HttpCalloutMock.class, new OASResponseMock(res));

        Map<String, Object> params = new Map<String, Object>{
            'custId' => 'null'
        };

        OASClient client;
        OASDefaultApi api;
        OASCustomer response;
        OASCustomer expectedResponse;
        String js = '';

        api = new OASDefaultApi(new OASClient());

        js = JSON.serialize(OASCustomer.getExample());
        res.setHeader('Content-Type', 'application/json');
        res.setBody(js);
        expectedResponse = OASCustomer.getExample();
        response = (OASCustomer) api.getCustomer(params);
        System.assertEquals(expectedResponse, response);
    }

    /**
     * 
     *
     * 
     */
    @isTest
    private static void getCustomersTest() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setStatus('OK');
        Test.setMock(HttpCalloutMock.class, new OASResponseMock(res));

        OASClient client;
        OASDefaultApi api;
        List<OASCustomer> response;
        List<OASCustomer> expectedResponse;
        String js = '';

        api = new OASDefaultApi(new OASClient());

        /*js = JSON.serialize(List.getExample());
        res.setHeader('Content-Type', 'application/json');
        res.setBody(js);
        expectedResponse = List.getExample();
        response = (List<OASCustomer>) api.getCustomers();
        System.assertEquals(expectedResponse, response);*/
    }
}