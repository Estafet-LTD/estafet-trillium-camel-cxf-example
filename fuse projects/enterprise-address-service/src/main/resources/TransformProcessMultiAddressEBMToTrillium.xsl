<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://webservices.globaladdress.net"
                xmlns:ns0="http://www.estafet.com/enterprise/messages/address/v1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ebo="http://www.estafet.com/enterprise/objects/address/v1"
                xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
                 
  <xsl:param name="userName"/>
  <xsl:param name="password"/>
  
  <xsl:template match="/">
  <soapenv:Envelope>
  <soapenv:Body>
    <tns:ProcessMultipleAddressesV2010Q2>
     <tns:username>
       <xsl:value-of select="$userName"/>
      </tns:username>
         <tns:password>
          <xsl:value-of select="$password"/>
         </tns:password>
         <!--  replace this in future -->
         <tns:AcceptanceLevel><xsl:text>1</xsl:text></tns:AcceptanceLevel>
         <tns:InnerAcceptancePC><xsl:text>1</xsl:text></tns:InnerAcceptancePC>
         <tns:OuterAcceptancePC><xsl:text>1</xsl:text></tns:OuterAcceptancePC>
    
      <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options">
        <tns:Options>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsMain">
            <tns:Options>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsMain/ebo:COptimaOption">
                <tns:COptimaOption>
                  <xsl:if test="@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <tns:OptionValue>
                    <xsl:value-of select="ebo:OptionValue"/>
                  </tns:OptionValue>
                </tns:COptimaOption>
              </xsl:for-each>
            </tns:Options>
          </xsl:if>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsMask">
            <tns:OptionMasks>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsMask/ebo:COptimaOptionMasks">
                <tns:COptimaOptionMasks>
                  <xsl:if test="@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <tns:OptionValue>
                    <xsl:value-of select="ebo:OptionValue"/>
                  </tns:OptionValue>
                </tns:COptimaOptionMasks>
              </xsl:for-each>
            </tns:OptionMasks>
          </xsl:if>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsOther">
            <tns:OptionsOther>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:Options/ebo:OptionsOther/ebo:COptimaOptionOther">
                <tns:COptimaOptionOther>
                  <xsl:if test="@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <tns:OptionName>
                    <xsl:value-of select="ebo:OptionName"/>
                  </tns:OptionName>
                  <xsl:if test="ebo:OptionValue">
                    <tns:OptionValue>
                      <xsl:value-of select="ebo:OptionValue"/>
                    </tns:OptionValue>
                  </xsl:if>
                </tns:COptimaOptionOther>
              </xsl:for-each>
            </tns:OptionsOther>
          </xsl:if>
        </tns:Options>
      </xsl:if>
      <tns:tmpContacts>
        <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressesEBM/ns0:DataArea/ns0:ProcessAddresses/ns0:AddressPostal">
          <tns:Contact>
            <xsl:if test="ebo:AddressLine1">
              <tns:AddressLine1>
                <xsl:value-of select="ebo:AddressLine1"/>
              </tns:AddressLine1>
            </xsl:if>
            <xsl:if test="ebo:AddressLine2">
              <tns:AddressLine2>
                <xsl:value-of select="ebo:AddressLine2"/>
              </tns:AddressLine2>
            </xsl:if>
            <xsl:if test="ebo:AddressLine3">
              <tns:AddressLine3>
                <xsl:value-of select="ebo:AddressLine3"/>
              </tns:AddressLine3>
            </xsl:if>
            <xsl:if test="ebo:AddressLine4">
              <tns:AddressLine4>
                <xsl:value-of select="ebo:AddressLine4"/>
              </tns:AddressLine4>
            </xsl:if>
            <xsl:if test="ebo:AddressLine5">
              <tns:AddressLine5>
                <xsl:value-of select="ebo:AddressLine5"/>
              </tns:AddressLine5>
            </xsl:if>
            <xsl:if test="ebo:AddressLine6">
              <tns:AddressLine6>
                <xsl:value-of select="ebo:AddressLine6"/>
              </tns:AddressLine6>
            </xsl:if>
            <xsl:if test="ebo:AddressLine7">
              <tns:AddressLine7>
                <xsl:value-of select="ebo:AddressLine7"/>
              </tns:AddressLine7>
            </xsl:if>
            <xsl:if test="ebo:AddressLine8">
              <tns:AddressLine8>
                <xsl:value-of select="ebo:AddressLine8"/>
              </tns:AddressLine8>
            </xsl:if>
            <xsl:if test="ebo:Company">
              <tns:Company>
                <xsl:value-of select="ebo:Company"/>
              </tns:Company>
            </xsl:if>
            <xsl:if test="ebo:Building">
              <tns:Building>
                <xsl:value-of select="ebo:Building"/>
              </tns:Building>
            </xsl:if>
            <xsl:if test="ebo:SubBuilding">
              <tns:SubBuilding>
                <xsl:value-of select="ebo:SubBuilding"/>
              </tns:SubBuilding>
            </xsl:if>
            <xsl:if test="ebo:Department">
              <tns:Department>
                <xsl:value-of select="ebo:Department"/>
              </tns:Department>
            </xsl:if>
            <xsl:if test="ebo:Premise">
              <tns:Premise>
                <xsl:value-of select="ebo:Premise"/>
              </tns:Premise>
            </xsl:if>
            <xsl:if test="ebo:Street">
              <tns:Street>
                <xsl:value-of select="ebo:Street"/>
              </tns:Street>
            </xsl:if>
            <xsl:if test="ebo:SubStreet">
              <tns:SubStreet>
                <xsl:value-of select="ebo:SubStreet"/>
              </tns:SubStreet>
            </xsl:if>
            <xsl:if test="ebo:POBox">
              <tns:POBox>
                <xsl:value-of select="ebo:POBox"/>
              </tns:POBox>
            </xsl:if>
            <xsl:if test="ebo:City">
              <tns:City>
                <xsl:value-of select="ebo:City"/>
              </tns:City>
            </xsl:if>
            <xsl:if test="ebo:SubCity">
              <tns:SubCity>
                <xsl:value-of select="ebo:SubCity"/>
              </tns:SubCity>
            </xsl:if>
            <xsl:if test="ebo:Principality">
              <tns:Principality>
                <xsl:value-of select="ebo:Principality"/>
              </tns:Principality>
            </xsl:if>
            <xsl:if test="ebo:Region">
              <tns:Region>
                <xsl:value-of select="ebo:Region"/>
              </tns:Region>
            </xsl:if>
            <xsl:if test="ebo:Postcode">
              <tns:Postcode>
                <xsl:value-of select="ebo:Postcode"/>
              </tns:Postcode>
            </xsl:if>
            <xsl:if test="ebo:DPS">
              <tns:DPS>
                <xsl:value-of select="ebo:DPS"/>
              </tns:DPS>
            </xsl:if>
            <xsl:if test="ebo:Cedex">
              <tns:Cedex>
                <xsl:value-of select="ebo:Cedex"/>
              </tns:Cedex>
            </xsl:if>
            <xsl:if test="ebo:Country">
              <tns:Country>
                <xsl:value-of select="ebo:Country"/>
              </tns:Country>
            </xsl:if>
            <xsl:if test="ebo:CountryISO">
              <tns:CountryISO>
                <xsl:value-of select="ebo:CountryISO"/>
              </tns:CountryISO>
            </xsl:if>
          </tns:Contact>
        </xsl:for-each>
      </tns:tmpContacts>
    </tns:ProcessMultipleAddressesV2010Q2>
    </soapenv:Body>
    </soapenv:Envelope>
  </xsl:template>
</xsl:stylesheet>
