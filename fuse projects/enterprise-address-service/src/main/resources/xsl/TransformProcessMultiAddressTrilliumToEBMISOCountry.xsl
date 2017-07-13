<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:tns="http://www.elsevier.com/enterprise/messages/address/v1"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns0="http://webservices.globaladdress.net" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
	xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
	xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
	xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:ebo="http://www.elsevier.com/enterprise/objects/address/v1"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<!-- Variable for the country ISO lookup codes -->
	<xsl:variable name="countryISOlookup" select="document('../xml/countryISO.xml')" />
	<xsl:template match="/">
		<soapenv:Envelope>
			<soapenv:Body>
				<tns:ProcessAddressesResponseEBM>
					<tns:DataArea>
						<tns:ProcessAddressesResponse>
							<tns:Result>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/ns0:ProcessMultipleAddressesV2010Q2Response/ns0:ProcessMultipleAddressesV2010Q2Result" />
							</tns:Result>
							<xsl:for-each
								select="/soapenv:Envelope/soapenv:Body/ns0:ProcessMultipleAddressesV2010Q2Response/ns0:tmpContacts/ns0:Contact">
								<xsl:variable name="ACR" select="ns0:ACR" />
								<tns:AddressPostal>
									<xsl:if test="ns0:AddressLine1">
										<ebo:AddressLine1>
											<xsl:value-of select="ns0:AddressLine1" />
										</ebo:AddressLine1>
									</xsl:if>
									<xsl:if test="ns0:AddressLine2">
										<ebo:AddressLine2>
											<xsl:value-of select="ns0:AddressLine2" />
										</ebo:AddressLine2>
									</xsl:if>
									<xsl:if test="ns0:AddressLine3">
										<ebo:AddressLine3>
											<xsl:value-of select="ns0:AddressLine3" />
										</ebo:AddressLine3>
									</xsl:if>
									<xsl:if test="ns0:AddressLine4">
										<ebo:AddressLine4>
											<xsl:value-of select="ns0:AddressLine4" />
										</ebo:AddressLine4>
									</xsl:if>
									<xsl:if test="ns0:AddressLine5">
										<ebo:AddressLine5>
											<xsl:value-of select="ns0:AddressLine5" />
										</ebo:AddressLine5>
									</xsl:if>
									<xsl:if test="ns0:AddressLine6">
										<ebo:AddressLine6>
											<xsl:value-of select="ns0:AddressLine6" />
										</ebo:AddressLine6>
									</xsl:if>
									<xsl:if test="ns0:AddressLine7">
										<ebo:AddressLine7>
											<xsl:value-of select="ns0:AddressLine7" />
										</ebo:AddressLine7>
									</xsl:if>
									<xsl:if test="ns0:AddressLine8">
										<ebo:AddressLine8>
											<xsl:value-of select="ns0:AddressLine8" />
										</ebo:AddressLine8>
									</xsl:if>
									<xsl:if test="ns0:Company">
										<ebo:Company>
											<xsl:value-of select="ns0:Company" />
										</ebo:Company>
									</xsl:if>
									<xsl:if test="ns0:Building">
										<ebo:Building>
											<xsl:value-of select="ns0:Building" />
										</ebo:Building>
									</xsl:if>
									<xsl:if test="ns0:SubBuilding">
										<ebo:SubBuilding>
											<xsl:value-of select="ns0:SubBuilding" />
										</ebo:SubBuilding>
									</xsl:if>
									<xsl:if test="ns0:Department">
										<ebo:Department>
											<xsl:value-of select="ns0:Department" />
										</ebo:Department>
									</xsl:if>
									<xsl:if test="ns0:Premise">
										<ebo:Premise>
											<xsl:if test="$ACR !=null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,5,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:Premise" />
										</ebo:Premise>
									</xsl:if>
									<xsl:if test="ns0:Street">
										<ebo:Street>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,7,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:Street" />
										</ebo:Street>
									</xsl:if>
									<xsl:if test="ns0:SubStreet">
										<ebo:SubStreet>
											<xsl:value-of select="ns0:SubStreet" />
										</ebo:SubStreet>
									</xsl:if>
									<xsl:if test="ns0:POBox">
										<ebo:POBox>
											<xsl:value-of select="ns0:POBox" />
										</ebo:POBox>
									</xsl:if>
									<xsl:if test="ns0:City">
										<ebo:City>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,11,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:City" />
										</ebo:City>
									</xsl:if>
									<xsl:if test="ns0:SubCity">
										<ebo:SubCity>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,9,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:SubCity" />
										</ebo:SubCity>
									</xsl:if>
									<xsl:if test="ns0:Principality">
										<ebo:Principality>
											<xsl:value-of select="ns0:Principality" />
										</ebo:Principality>
									</xsl:if>
									<xsl:if test="ns0:Region">
										<ebo:Region>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,13,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:Region" />
										</ebo:Region>
									</xsl:if>
									<xsl:if test="ns0:Postcode">
										<ebo:Postcode>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,15,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:Postcode" />
										</ebo:Postcode>
									</xsl:if>
									<xsl:if test="ns0:DPS">
										<ebo:DPS>
											<xsl:value-of select="ns0:DPS" />
										</ebo:DPS>
									</xsl:if>
									<xsl:if test="ns0:Cedex">
										<ebo:Cedex>
											<xsl:value-of select="ns0:Cedex" />
										</ebo:Cedex>
									</xsl:if>
									<xsl:if test="ns0:Country">
										<ebo:Country>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,17,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ns0:Country" />
										</ebo:Country>
									</xsl:if>
									<xsl:if test="ns0:CountryISO">
										<xsl:variable name="ISOCountry" select="ns0:CountryISO" />
										<xsl:choose>
											<xsl:when test="string-length($ISOCountry) = 3">
												<ebo:CountryISO>
													<xsl:attribute name="iso3"><xsl:value-of
														select="$ISOCountry" /></xsl:attribute>
													<xsl:value-of
														select="$countryISOlookup/lookupISO/country[iso3 = $ISOCountry]/iso2" />
												</ebo:CountryISO>
											</xsl:when>
											<xsl:otherwise>
												<ebo:CountryISO>
													<xsl:attribute name="iso3">
												<xsl:value-of
														select="$countryISOlookup/lookupISO/country[iso2 = $ISOCountry]/iso3" />	
												</xsl:attribute>
													<xsl:value-of select="$ISOCountry" />
												</ebo:CountryISO>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>


									<xsl:if test="ns0:Other9">
										<ebo:Latitude>
											<xsl:value-of select="ns0:Other9" />
										</ebo:Latitude>
									</xsl:if>

									<xsl:if test="ns0:Other10">
										<ebo:Longitude>
											<xsl:value-of select="ns0:Other10" />
										</ebo:Longitude>
									</xsl:if>

									<xsl:if test="ns0:Metadata">
										<xsl:variable name="Metadata" select="ns0:Metadata" />
										<xsl:if test="$Metadata/ns0:mType = 'providername'">
											<ProviderName>
												<xsl:value-of select="$Metadata/ns0:sValue" />
											</ProviderName>
										</xsl:if>
										<xsl:if test="$Metadata/ns0:mType = 'providertype'">
											<ProviderType>
												<xsl:value-of select="$Metadata/ns0:sValue" />
											</ProviderType>
										</xsl:if>
									</xsl:if>

									<ebo:Quality>
										<xsl:value-of select="substring($ACR,1,2)" />
									</ebo:Quality>
									<ebo:Match>
										<xsl:value-of select="substring($ACR,19)" />
									</ebo:Match>
									<ebo:ACR>
										<xsl:value-of select="$ACR" />
									</ebo:ACR>

								</tns:AddressPostal>
							</xsl:for-each>
						</tns:ProcessAddressesResponse>
					</tns:DataArea>
				</tns:ProcessAddressesResponseEBM>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
