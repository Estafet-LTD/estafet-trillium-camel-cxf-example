package com.estafet.fuse.reference;

import java.util.Dictionary;

import org.apache.camel.Produce;
import org.apache.camel.ProducerTemplate;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.blueprint.CamelBlueprintTestSupport;
import org.junit.Test;

public class RouteTest2 extends CamelBlueprintTestSupport {
	
	// TODO Create test message bodies that work for the route(s) being tested
		// Expected message bodies
		protected Object[] expectedBodies = {
				"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:v1=\"http://www.elsevier.com/enterprise/messages/address/v1\" xmlns:v11=\"http://www.elsevier.com/enterprise/objects/address/v1\"><soapenv:Header/><soapenv:Body><v1:FormatAddressEBM><v1:DataArea><v1:FormatAddress><v1:User>ElsevierTest</v1:User><v1:AddressPostal><v11:Premise>236</v11:Premise><v11:Street>London Road</v11:Street><v11:City>Oxford</v11:City><v11:Postcode>OX3 9EG</v11:Postcode><v11:CountryISO>IE</v11:CountryISO></v1:AddressPostal></v1:FormatAddress></v1:DataArea></v1:FormatAddressEBM></soapenv:Body></soapenv:Envelope>",
				"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:v1=\"http://www.elsevier.com/enterprise/messages/address/v1\" xmlns:v11=\"http://www.elsevier.com/enterprise/objects/address/v1\"><soapenv:Header/><soapenv:Body><v1:FormatAddressEBM><v1:DataArea><v1:FormatAddress><v1:User>ElsevierTest</v1:User><v1:AddressPostal><v11:Premise>236</v11:Premise><v11:Street>London Road</v11:Street><v11:City>Oxford</v11:City><v11:Postcode>OX3 9EG</v11:Postcode><v11:CountryISO>IE</v11:CountryISO></v1:AddressPostal></v1:FormatAddress></v1:DataArea></v1:FormatAddressEBM></soapenv:Body></soapenv:Envelope>" };
		
	// Templates to send to input endpoints
	@Produce(uri = "cxf://bean:PostalAddressConsumerWS")
	protected ProducerTemplate inputEndpoint;
	
	
	
    @Override
    protected String getBlueprintDescriptor() {
        return "/OSGI-INF/blueprint/blueprint.xml";
    }
    
    @Override
    protected String[] loadConfigAdminConfigurationFile() {
        // which .cfg file to use, and the name of the persistence-id
        return new String[]{"src/test/resources/etc/service.properties", "service"};
    }
    
    @Override
    protected String useOverridePropertiesWithConfigAdmin(Dictionary props) throws Exception {
        // return the persistence-id to use
        return "service";
    }
 

    @Test
    public void testRoute() throws Exception {
    	// Define some expectations
    	System.out.println(inputEndpoint.toString()); 
    	// For now, let's just wait for some messages// TODO Add some expectations here
  
    	// Send some messages to input endpoints
    	for (Object expectedBody : expectedBodies) {
    		//inputEndpoint.requestBodyAndHeader(expectedBody, "SOAPAction","http://www.elsevier.com/enterprise/services/address/v1/FormatAddress"); 
    		inputEndpoint.requestBody(expectedBody); 	
    	}

    }

}
