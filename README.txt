Trillium Example
=============

The example here was originally created for a customer who wished to call the global address service provided by Trillium/Pitney Bowes software and was used to demonstrate the use of Camel and CXF web services. 

The Camel solution exposes a cxf endpoint which implements an Enterprise Business Service (EBS) which relies on an Enterprise Business Message (EBM) and Enterprise Business Objects (EBO) schemas. These represent the in-house canonical model and are held in the enterprise-schemas project:
AddressEBS.wsdl
AddressEBM.xsd
AddressEBO.xsd 

Trillium is a paid service and the wsdl is available at https://soap.globaladdress.net/globaladdress.asmx?wsdl

The Camel solution allows calls into the AddressEBS which are transformed using Extensible Stylesheet Language Transformations (xslt). These are supported out of the box by Camel components. The transformed messages are routed to the Trillium service endpoint and the response from Trillium is transformed back to the response expected by the canonical model.

GitHub Repo
==========

The projects are in the Estafet github under https://github.com/Estafet-LTD/estafet-trillium-camel-cxf-example

Mock Trillium Service 
================

The original application called the actual Trillium internet service using a test userid and password. This is no longer available so the current example uses a mock service running in SoapUI under the SoapUI project TrilliumTest-soapui-project.xml. The mock service is named TrilliumMock and will need to be started via SoapUI. The mock service listens by default on localhost:8080. Note that this is hard-coded in the Camel blueprint file under <!-- The producer endpoint --> and will need to be changed if not using the default.

There are 4 mocked operations in the mock service which are a subset of the operations that the real Trillium service provides and which are the only operations that the EBS service is set up to call. 
- SearchAddressV2014Q1
- FormatAddressV2010Q2
- ProcessAddressV2010Q2
- ProcessMultipleAddressesV2010Q2

JBoss Projects
===========

There are 4 projects for JBoss Developer Studio
- enterprise-address-service = this is the main project containing the Camel route and xslt documents
- enterprise-features = this can be used to create a deployment 'feature'
- enterprise-parent = this contains the parent pom for the build
- enterprise-schemas = this contains the wsdl and xsd files for the service

Camel Route
==========

The Camel route uses the blueprint Domain Specific Language (DSL) to define the required components and uses out of the box components.

- CXF endpoints for consumer (the listener service) and producer ("Trillium")
- XSL transformations for transforming requests to and from the canonical form using lookup variables
- Log statements
- Examples of a choice based on incoming request operation

Build and Deploy
=============

- check out the fuse projects from github 

Quick Deploy
------------------

- Take the SNAPSHOT jar files from the enterprise-schemas\target and enterprise-address-service\target which are pre-built
- Copy these files into the deploy directory of a running JBoss Fuse instance
- Test that the service is up by looking in the Fuse log
- Test the service availability by invoking http://localhost:9200/cxf/postaladdressvalidator?wsdl
- Test using the SoapUI test project (described below)

Full Build
-------------

- Import all 4 projects into JBoss Developer Studio = Import | Git | Projects from Git (with smart import)
- Run the Camel route locally if desired using Run As | Local Camel Context (without tests)
- Use Run As | Maven install to generate the target bundles (jar files with OSGI details in MANIFEST.MF) via the parent pom
- Take the SNAPSHOT jar files from the enterprise-schemas\target and enterprise-address-service\target
- Copy these files into the deploy directory of a running JBoss Fuse instance
- Test that the service is up by looking in the Fuse log
- Test the service availability by invoking http://localhost:9200/cxf/postaladdressvalidator?wsdl
- Test using the SoapUI test project (described below) 


SoapUI Test Project
===============

The service is tested using SoapUI test project EnterpriseAddesssServiceTests-soapui-project.xml. Each of the 4 EBS operations have corresponding sample requests. Note that because the response is mocked changing the request has no effect - i.e. this is not really searching for an address!
