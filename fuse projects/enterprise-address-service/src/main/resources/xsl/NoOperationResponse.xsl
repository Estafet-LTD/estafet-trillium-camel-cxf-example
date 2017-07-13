
<xsl:stylesheet version="1.0" xmlns:tns="http://www.elsevier.com/AddressService/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" >
   <xsl:template match="/">
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
      <soapenv:Header/>
      <soapenv:Body>
      <soapenv:Fault >

		<faultcode>Server</faultcode>
		<faultstring>Invalid operation specified in request</faultstring>
		<faultactor/>
		<detail>
		<business/>
		</detail>
</soapenv:Fault>
</soapenv:Body>
</soapenv:Envelope>
 
   </xsl:template>
</xsl:stylesheet>