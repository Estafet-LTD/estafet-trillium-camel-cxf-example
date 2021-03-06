<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://www.estafet.com/enterprise/messages/address/v1"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns0="http://webservices.globaladdress.net" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
	xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
	xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
	xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:ebo="http://www.estafet.com/enterprise/objects/address/v1"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:template match="/">
		<soapenv:Envelope>
			<soapenv:Body>
				<tns:ProcessAddressResponseEBM>
					<tns:DataArea>
						<tns:ProcessAddressResponse>
							
								<xsl:variable name="ACR"
									select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:ACR" />
							
							<tns:Result>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:ProcessAddressV2010Q2Result" />
							</tns:Result>
							<xsl:if
								test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact">
								<tns:AddressPostal>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine1">
										<ebo:AddressLine1>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine1" />
										</ebo:AddressLine1>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine2">
										<ebo:AddressLine2>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine2" />
										</ebo:AddressLine2>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine3">
										<ebo:AddressLine3>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine3" />
										</ebo:AddressLine3>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine4">
										<ebo:AddressLine4>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine4" />
										</ebo:AddressLine4>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine5">
										<ebo:AddressLine5>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine5" />
										</ebo:AddressLine5>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine6">
										<ebo:AddressLine6>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine6" />
										</ebo:AddressLine6>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine7">
										<ebo:AddressLine7>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine7" />
										</ebo:AddressLine7>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine8">
										<ebo:AddressLine8>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:AddressLine8" />
										</ebo:AddressLine8>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Company">
										<ebo:Company>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Company" />
										</ebo:Company>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Building">
										<ebo:Building>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Building" />
										</ebo:Building>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubBuilding">
										<ebo:SubBuilding>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubBuilding" />
										</ebo:SubBuilding>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Department">
										<ebo:Department>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Department" />
										</ebo:Department>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Premise">
										<ebo:Premise>
											<xsl:if test="$ACR !=null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,5,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Premise" />
										</ebo:Premise>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Street">
										<ebo:Street>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,7,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Street" />
										</ebo:Street>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubStreet">
										<ebo:SubStreet>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubStreet" />
										</ebo:SubStreet>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:POBox">
										<ebo:POBox>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:POBox" />
										</ebo:POBox>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:City">
										<ebo:City>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,11,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:City" />
										</ebo:City>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubCity">
										<ebo:SubCity>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,9,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:SubCity" />
										</ebo:SubCity>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Principality">
										<ebo:Principality>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Principality" />
										</ebo:Principality>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Region">
										<ebo:Region>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,13,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Region" />
										</ebo:Region>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Postcode">
										<ebo:Postcode>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,15,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Postcode" />
										</ebo:Postcode>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:DPS">
										<ebo:DPS>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:DPS" />
										</ebo:DPS>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Cedex">
										<ebo:Cedex>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Cedex" />
										</ebo:Cedex>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Country">
										<ebo:Country>
											<xsl:if test="$ACR != null">
												<xsl:attribute name="status"><xsl:value-of
													select="substring($ACR,17,1) " /></xsl:attribute>
											</xsl:if>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Country" />
										</ebo:Country>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:CountryISO">
										<xsl:variable name="ISOCountry"
											select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:CountryISO" />
										<xsl:choose>
											<xsl:when test="string-length($ISOCountry) = 3">
												<ebo:CountryISO>
													<xsl:attribute name="iso3"><xsl:value-of
														select="$ISOCountry" /></xsl:attribute>
													<xsl:value-of
														select="document('countryISO.xml')/lookupISO/country[iso3 = $ISOCountry]/iso2" />
												</ebo:CountryISO>
											</xsl:when>
											<xsl:otherwise>
												<ebo:CountryISO>
													<xsl:attribute name="iso3">
												<xsl:value-of
														select="document('countryISO.xml')/lookupISO/country[iso2 = $ISOCountry]/iso3" />	
												</xsl:attribute>
													<xsl:value-of select="$ISOCountry" />
												</ebo:CountryISO>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Other9">
										<ebo:Latitude>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Other9" />
										</ebo:Latitude>
									</xsl:if>

									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Other10">
										<ebo:Longitude>
											<xsl:value-of
												select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:contact/ns0:Other10" />
										</ebo:Longitude>
									</xsl:if>

									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:returnData/ns0:Metadata">
										<xsl:variable name="Metadata"
											select="/soapenv:Envelope/soapenv:Body/ns0:ProcessAddressV2010Q2Response/ns0:returnData/ns0:Metadata" />
										<xsl:if test="$Metadata/ns0:mType = 'providername'">
											<ebo:ProviderName>
												<xsl:value-of select="$Metadata/ns0:sValue" />
											</ebo:ProviderName>
										</xsl:if>
										<xsl:if test="$Metadata/ns0:mType = 'providertype'">
											<ebo:ProviderType>
												<xsl:value-of select="$Metadata/ns0:sValue" />
											</ebo:ProviderType>
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
							</xsl:if>
						</tns:ProcessAddressResponse>
					</tns:DataArea>
				</tns:ProcessAddressResponseEBM>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
