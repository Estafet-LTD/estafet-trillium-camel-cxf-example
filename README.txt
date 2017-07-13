Trillium Example
-----------------------

The example here was originally created for a customer who wished to call the global address service provided by Trillium/Pitney Bowes software and was used to demonstrate the use of Camel and CXF web services. 

The Camel solution exposes a cxf endpoint which implements an Enterprise Business Service (EBS) which relies on an Enterprise Business Message (EBM) and Enterprise Business Objects (EBO) schemas. These represent the in-house canonical model and are held in the enterprise-schemas project:
AddressEBS.wsdl
AddressEBM.xsd
AddressEBO.xsd 

Trillium is a paid service and the wsdl is available at https://soap.globaladdress.net/globaladdress.asmx?wsdl

The Camel solution allows calls into the AddressEBS which are transformed using Extensible Stylesheet Language Transformations (xslt). These are supported out of the box by Camel components. The transformed messages are routed to the Trillium service endpoint and the response from Trillium is transformed back to the response expected by the canonical model.


Mock Trillium Service 
-----------------------------

The original application called the actual Trillium internet service using a test userid and password. This is no longer available so the current example uses a mock service running in SoapUI under the SoapUI project TrilliumTest-soapui-project.xml. The mock service is named TrilliumMock

There are 4 mocked operations in the mock service - which listens by default on localhost:8080
- SearchAddressV2014Q1
- FormatAddressV2010Q2
- ProcessAddressV2010Q2
- ProcessMultipleAddressesV2010Q2

Camel Route
------------------

The Camel route uses the blueprint Domain Specific Language (DSL) to define the required components and uses out of the box components.

Test Project
-----------------

The service is tested using SoapUI test project EnterpriseAddesssServiceTests-soapui-project.xml. Each of the 4 EBS operations have corresponding sample requests. Note that because the response is mocked changing the request has no effect - i.e. this is not really searching for an address!
