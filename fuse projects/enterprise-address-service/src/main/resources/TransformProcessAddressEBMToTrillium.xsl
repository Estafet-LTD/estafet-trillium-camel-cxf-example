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
  <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <tns:ProcessAddressV2010Q2>
     <tns:username>
       <xsl:value-of select="$userName"/>
      </tns:username>
         <tns:password>
          <xsl:value-of select="$password"/>
                    </tns:password>
             
                   
            <xsl:variable name="Quality" select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Quality" /> 
              <xsl:choose>
					<xsl:when test="number(substring($Quality,2,1)) > -1">
							<tns:AcceptanceLevel><xsl:value-of select="substring($Quality,2,1)"/></tns:AcceptanceLevel>
					</xsl:when>   
					<xsl:otherwise><tns:AcceptanceLevel><xsl:text>-1</xsl:text></tns:AcceptanceLevel></xsl:otherwise> 
					</xsl:choose>  
             <xsl:variable name="Match" select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Match" /> 
              <xsl:choose>
					<xsl:when test="number(substring($Match,1,3)) > -1">
							<tns:InnerAcceptance><xsl:value-of select="substring($Match,1,3)"/></tns:InnerAcceptance>
					</xsl:when>   
					<xsl:otherwise>
					<tns:InnerAcceptance><xsl:text>80</xsl:text></tns:InnerAcceptance>
					<tns:OuterAcceptance><xsl:text>0</xsl:text></tns:OuterAcceptance>
					</xsl:otherwise> 
					</xsl:choose>   
       
         
         
         <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:EnhancementDatasetName">
          <tns:EnhancementDatasetName>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:EnhancementDatasetName"/>
          </tns:EnhancementDatasetName>
        </xsl:if>
         
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options">
        <tns:Options>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsMain">
            <tns:Options>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsMain/ebo:COptimaOption">
                <tns:COptimaOption>
                  <xsl:if test="@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <tns:OptionNumber>
                    <xsl:value-of select="ebo:OptionName"/>
                  </tns:OptionNumber>
                  <tns:OptionValue>
                    <xsl:value-of select="ebo:OptionValue"/>
                  </tns:OptionValue>
                </tns:COptimaOption>
              </xsl:for-each>
            </tns:Options>
          </xsl:if>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsMask">
            <tns:OptionMasks>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsMask/ebo:COptimaOptionMasks">
                <tns:COptimaOptionMasks>
                  <xsl:if test="@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <tns:OptionNumber>
                    <xsl:value-of select="ebo:OptionName"/>
                  </tns:OptionNumber>
                  <tns:FieldNumber>
                    <xsl:value-of select="ebo:FieldName"/>
                  </tns:FieldNumber>
                  <tns:OptionValue>
                    <xsl:value-of select="ebo:OptionValue"/>
                  </tns:OptionValue>
                </tns:COptimaOptionMasks>
              </xsl:for-each>
            </tns:OptionMasks>
          </xsl:if>
          <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsOther">
            <tns:OptionsOther>
              <xsl:for-each select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:Options/ebo:OptionsOther/ebo:COptimaOptionOther">
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
         
       <tns:returnData>
			<tns:MetaData>
			   <tns:mType>providername</tns:mType>
			   <tns:sValue></tns:sValue>
			</tns:MetaData>
				<tns:MetaData>
			   <tns:mType>providertype</tns:mType>
			   <tns:sValue></tns:sValue>
			</tns:MetaData>
		 	</tns:returnData>   
      <tns:contact>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine1">
          <tns:AddressLine1>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine1"/>
          </tns:AddressLine1>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine2">
          <tns:AddressLine2>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine2"/>
          </tns:AddressLine2>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine3">
          <tns:AddressLine3>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine3"/>
          </tns:AddressLine3>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine4">
          <tns:AddressLine4>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine4"/>
          </tns:AddressLine4>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine5">
          <tns:AddressLine5>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine5"/>
          </tns:AddressLine5>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine6">
          <tns:AddressLine6>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine6"/>
          </tns:AddressLine6>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine7">
          <tns:AddressLine7>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine7"/>
          </tns:AddressLine7>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine8">
          <tns:AddressLine8>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:AddressLine8"/>
          </tns:AddressLine8>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Company">
          <tns:Company>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Company"/>
          </tns:Company>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Building">
          <tns:Building>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Building"/>
          </tns:Building>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubBuilding">
          <tns:SubBuilding>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubBuilding"/>
          </tns:SubBuilding>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Department">
          <tns:Department>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Department"/>
          </tns:Department>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Premise">
          <tns:Premise>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Premise"/>
          </tns:Premise>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Street">
          <tns:Street>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Street"/>
          </tns:Street>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubStreet">
          <tns:SubStreet>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubStreet"/>
          </tns:SubStreet>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:POBox">
          <tns:POBox>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:POBox"/>
          </tns:POBox>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:City">
          <tns:City>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:City"/>
          </tns:City>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubCity">
          <tns:SubCity>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:SubCity"/>
          </tns:SubCity>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Principality">
          <tns:Principality>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Principality"/>
          </tns:Principality>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Region">
          <tns:Region>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Region"/>
          </tns:Region>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Postcode">
          <tns:Postcode>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Postcode"/>
          </tns:Postcode>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:DPS">
          <tns:DPS>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:DPS"/>
          </tns:DPS>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Cedex">
          <tns:Cedex>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Cedex"/>
          </tns:Cedex>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Country">
          <tns:Country>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:Country"/>
          </tns:Country>
        </xsl:if>
        <xsl:if test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:CountryISO">
          <tns:CountryISO>
            <xsl:value-of select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressEBM/ns0:DataArea/ns0:ProcessAddress/ns0:AddressPostal/ebo:CountryISO"/>
          </tns:CountryISO>
        </xsl:if>
      </tns:contact>
    </tns:ProcessAddressV2010Q2>
    </soapenv:Body>
    </soapenv:Envelope>
  </xsl:template>
</xsl:stylesheet>
