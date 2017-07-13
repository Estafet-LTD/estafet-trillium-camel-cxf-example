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

	<!-- Parameter determines whether we want verbose descriptions from the 
		ACR. Passed in as a header from the camel route -->
	<xsl:param name="verbose" />

	<!-- Variables for the lookup files - component status, validation, and 
		country ISO codes -->
	<xsl:variable name="complookup"
		select="document('../xml/componentStatus.xml')" />
	<xsl:variable name="validationlookup" select="document('../xml/validation.xml')" />
	<xsl:variable name="countryISOlookup" select="document('../xml/countryISO.xml')" />
	<xsl:template match="/">
		<soapenv:Envelope>
			<soapenv:Body>
				<tns:SearchAddressResponseEBM>
					<tns:DataArea>
						<tns:SearchAddressResponse>
							<tns:Result>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/ns0:SearchAddressV2014Q1Response/ns0:SearchAddressV2014Q1Result" />
							</tns:Result>

							<xsl:for-each
								select="/soapenv:Envelope/soapenv:Body/ns0:SearchAddressV2014Q1Response/ns0:tmpContacts/ns0:Contact">
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
										<xsl:variable name="premstat" select="substring($ACR, 4, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:Premise>
													<xsl:attribute name="status"><xsl:value-of
														select="$premstat" /></xsl:attribute>


													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $premstat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $premstat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:Premise" />
												</ebo:Premise>
											</xsl:when>
											<xsl:otherwise>
												<ebo:Premise>
													<xsl:attribute name="status"><xsl:value-of
														select="$premstat" /></xsl:attribute>
													<xsl:value-of select="ns0:Premise" />
												</ebo:Premise>
											</xsl:otherwise>
										</xsl:choose>



									</xsl:if>
									<xsl:if test="ns0:Street">
										<xsl:variable name="streetstat" select="substring($ACR, 6, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:Street>
													<xsl:attribute name="status"><xsl:value-of
														select="$streetstat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $streetstat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $streetstat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:Street" />
												</ebo:Street>
											</xsl:when>
											<xsl:otherwise>
												<ebo:Street>
													<xsl:attribute name="status"><xsl:value-of
														select="$streetstat" /></xsl:attribute>
													<xsl:value-of select="ns0:Street" />
												</ebo:Street>
											</xsl:otherwise>
										</xsl:choose>
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
										<xsl:variable name="citystat" select="substring($ACR, 10, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:City>
													<xsl:attribute name="status"><xsl:value-of
														select="$citystat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $citystat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $citystat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:City" />
												</ebo:City>
											</xsl:when>
											<xsl:otherwise>
												<ebo:City>
													<xsl:attribute name="status"><xsl:value-of
														select="$citystat" /></xsl:attribute>
													<xsl:value-of select="ns0:City" />
												</ebo:City>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="ns0:SubCity">
										<xsl:variable name="subcitystat" select="substring($ACR, 8, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:SubCity>
													<xsl:attribute name="status"><xsl:value-of
														select="$subcitystat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $subcitystat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $subcitystat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:SubCity" />
												</ebo:SubCity>
											</xsl:when>
											<xsl:otherwise>
												<ebo:SubCity>
													<xsl:attribute name="status"><xsl:value-of
														select="$subcitystat" /></xsl:attribute>
													<xsl:value-of select="ns0:SubCity" />
												</ebo:SubCity>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="ns0:Principality">
										<ebo:Principality>
											<xsl:value-of select="ns0:Principality" />
										</ebo:Principality>
									</xsl:if>
									<xsl:if test="ns0:Region">
										<xsl:variable name="regionstat" select="substring($ACR, 12, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:Region>
													<xsl:attribute name="status"><xsl:value-of
														select="$regionstat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $regionstat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $regionstat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:Region" />
												</ebo:Region>
											</xsl:when>
											<xsl:otherwise>
												<ebo:Region>
													<xsl:attribute name="status"><xsl:value-of
														select="$regionstat" /></xsl:attribute>
													<xsl:value-of select="ns0:Region" />
												</ebo:Region>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="ns0:Postcode">
										<xsl:variable name="zipstat" select="substring($ACR, 14, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:Postcode>
													<xsl:attribute name="status"><xsl:value-of
														select="$zipstat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $zipstat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $zipstat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:Postcode" />
												</ebo:Postcode>
											</xsl:when>
											<xsl:otherwise>
												<ebo:Postcode>
													<xsl:attribute name="status"><xsl:value-of
														select="$zipstat" /></xsl:attribute>
													<xsl:value-of select="ns0:Postcode" />
												</ebo:Postcode>
											</xsl:otherwise>
										</xsl:choose>
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
										<xsl:variable name="countrystat" select="substring($ACR, 16, 2)" />
										<xsl:choose>
											<xsl:when test="$verbose='true'">
												<ebo:Country>
													<xsl:attribute name="status"><xsl:value-of
														select="$countrystat" /></xsl:attribute>
													<xsl:attribute name="desc"><xsl:value-of
														select="$complookup/componentStatus/status[code = $countrystat]/desc" /></xsl:attribute>
													<xsl:attribute name="level"><xsl:value-of
														select="$complookup/componentStatus/status[code = $countrystat]/level" /></xsl:attribute>
													<xsl:value-of select="ns0:Country" />
												</ebo:Country>
											</xsl:when>
											<xsl:otherwise>
												<ebo:Country>
													<xsl:attribute name="status"><xsl:value-of
														select="$countrystat" /></xsl:attribute>
													<xsl:value-of select="ns0:Country" />
												</ebo:Country>
											</xsl:otherwise>
										</xsl:choose>
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

									<xsl:if
										test="/soapenv:Envelope/soapenv:Body/ns0:SearchAddressV2014Q1Response/ns0:returnData/ns0:Metadata">
										<xsl:variable name="Metadata"
											select="/soapenv:Envelope/soapenv:Body/ns0:SearchAddressV2014Q1Response/ns0:returnData/ns0:Metadata" />
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


									<xsl:variable name="valid" select="substring($ACR,1,2)" />
									<xsl:choose>

										<xsl:when test="$verbose='true'">
											<ebo:Quality>
												<xsl:attribute name="desc"><xsl:value-of
													select="$validationlookup/lookupValidation/validation[code = $valid]/desc" /></xsl:attribute>
												<xsl:attribute name="level"><xsl:value-of
													select="$validationlookup/lookupValidation/validation[code = $valid]/level" /></xsl:attribute>
												<xsl:value-of select="$valid" />
											</ebo:Quality>
										</xsl:when>
										<xsl:otherwise>
											<ebo:Quality>
												<xsl:value-of select="$valid" />
											</ebo:Quality>
										</xsl:otherwise>
									</xsl:choose>


									<xsl:variable name="matchval" select="substring($ACR,19)" />
									<xsl:choose>

										<xsl:when test="$verbose='true'">
											<xsl:variable name="matchchange">
												<xsl:value-of select="100 - number($matchval)" />
											</xsl:variable>
											<ebo:Match>
												<xsl:attribute name="desc"><xsl:value-of
													select="concat(concat('With ',string($matchchange)), '% change')" /></xsl:attribute>
												<xsl:attribute name="level"><xsl:text>1</xsl:text></xsl:attribute>
												<xsl:value-of select="$matchval" />
											</ebo:Match>
										</xsl:when>
										<xsl:otherwise>
											<ebo:Match>
												<xsl:value-of select="$matchval" />
											</ebo:Match>
										</xsl:otherwise>
									</xsl:choose>
									<ebo:SupplierQuality>
										<xsl:value-of select="$ACR" />
									</ebo:SupplierQuality>




								</tns:AddressPostal>
							</xsl:for-each>


						</tns:SearchAddressResponse>
					</tns:DataArea>
				</tns:SearchAddressResponseEBM>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>



