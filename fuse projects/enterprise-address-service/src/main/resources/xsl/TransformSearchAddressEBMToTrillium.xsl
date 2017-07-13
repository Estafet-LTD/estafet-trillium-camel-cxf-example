<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:tns="http://webservices.globaladdress.net" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:v1="http://www.elsevier.com/enterprise/messages/address/v1"
	xmlns:v11="http://www.elsevier.com/enterprise/objects/address/v1"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:adr="http://www.elsevier.com/osb/adr" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
	xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/"
	xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
	xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

	<xsl:param name="userName" />
	<xsl:param name="password" />
	<xsl:template match="/">
		<soapenv:Envelope>
			<soapenv:Body>
				<tns:SearchAddressV2014Q1>
					<tns:username>
						<xsl:value-of select="$userName" />
					</tns:username>

					<tns:password>
						<xsl:value-of select="$password" />
					</tns:password>
					<tns:tmpContact>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine1">
							<tns:AddressLine1>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine1" />
							</tns:AddressLine1>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine2">
							<tns:AddressLine2>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine2" />
							</tns:AddressLine2>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine3">
							<tns:AddressLine3>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine3" />
							</tns:AddressLine3>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine4">
							<tns:AddressLine4>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine4" />
							</tns:AddressLine4>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine5">
							<tns:AddressLine5>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine5" />
							</tns:AddressLine5>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine6">
							<tns:AddressLine6>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v11:AddressPostal/v11:AddressLine6" />
							</tns:AddressLine6>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine7">
							<tns:AddressLine7>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v11:AddressPostal/v11:AddressLine7" />
							</tns:AddressLine7>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:AddressLine8">
							<tns:AddressLine8>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v11:AddressPostal/v11:AddressLine8" />
							</tns:AddressLine8>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Company">
							<tns:Company>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v11:AddressPostal/v11:Company" />
							</tns:Company>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Building">
							<tns:Building>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Building" />
							</tns:Building>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubBuilding">
							<tns:SubBuilding>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubBuilding" />
							</tns:SubBuilding>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Department">
							<tns:Department>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Department" />
							</tns:Department>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Premise">
							<tns:Premise>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Premise" />
							</tns:Premise>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Street">
							<tns:Street>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Street" />
							</tns:Street>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubStreet">
							<tns:SubStreet>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubStreet" />
							</tns:SubStreet>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:POBox">
							<tns:POBox>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:POBox" />
							</tns:POBox>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:City">
							<tns:City>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:City" />
							</tns:City>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubCity">
							<tns:SubCity>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:SubCity" />
							</tns:SubCity>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Principality">
							<tns:Principality>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Principality" />
							</tns:Principality>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Region">
							<tns:Region>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Region" />
							</tns:Region>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Postcode">
							<tns:Postcode>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Postcode" />
							</tns:Postcode>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:DPS">
							<tns:DPS>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:DPS" />
							</tns:DPS>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Cedex">
							<tns:Cedex>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Cedex" />
							</tns:Cedex>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Country">
							<tns:Country>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:Country" />
							</tns:Country>
						</xsl:if>
						<xsl:if
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:CountryISO">
							<tns:CountryISO>
								<xsl:value-of
									select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v11:CountryISO" />
							</tns:CountryISO>
						</xsl:if>
					</tns:tmpContact>


					<tns:maxresults>
						<xsl:variable name="maxres"
							select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:AddressPostal/v1:MaxResults" />
						<xsl:choose>
							<xsl:when test="not($maxres)">
								<xsl:text>25</xsl:text>
							</xsl:when>
							<xsl:when test="1 > string-length(normalize-space($maxres))">
								<xsl:text>25</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$maxres" />
							</xsl:otherwise>
						</xsl:choose>
					</tns:maxresults>
					<tns:returnData>
						<tns:MetaData>
							<tns:mType>duration</tns:mType>
							<tns:sValue></tns:sValue>
						</tns:MetaData>
						<tns:MetaData>
							<tns:mType>providername</tns:mType>
							<tns:sValue></tns:sValue>
						</tns:MetaData>
						<tns:MetaData>
							<tns:mType>providertype</tns:mType>
							<tns:sValue></tns:sValue>
						</tns:MetaData>
					</tns:returnData>

					<xsl:choose>
						<xsl:when
							test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options">
							<tns:Options>
								<xsl:if
									test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsMain">
									<tns:Options>
										<xsl:for-each
											select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsMain/v11:COptimaOption">
											<tns:COptimaOption>
												<xsl:if test="@xsi:nil">
													<xsl:attribute name="nil"
														namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil" />
                    </xsl:attribute>
												</xsl:if>
												<tns:OptionNumber>
													<xsl:value-of select="OptionName" />
												</tns:OptionNumber>
												<tns:OptionValue>
													<xsl:value-of select="OptionValue" />
												</tns:OptionValue>
											</tns:COptimaOption>
										</xsl:for-each>
									</tns:Options>
								</xsl:if>
								<xsl:if
									test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsMask">
									<tns:OptionMasks>
										<xsl:for-each
											select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsMask/v11:COptimaOptionMasks">
											<tns:COptimaOptionMasks>
												<xsl:if test="@xsi:nil">
													<xsl:attribute name="nil"
														namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil" />
                    </xsl:attribute>
												</xsl:if>
												<tns:OptionNumber>
													<xsl:value-of select="OptionName" />
												</tns:OptionNumber>
												<tns:FieldNumber>
													<xsl:value-of select="FieldName" />
												</tns:FieldNumber>
												<tns:OptionValue>
													<xsl:value-of select="OptionValue" />
												</tns:OptionValue>
											</tns:COptimaOptionMasks>
										</xsl:for-each>
									</tns:OptionMasks>
								</xsl:if>
								<xsl:if
									test="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsOther">
									<tns:OptionsOther>
										<xsl:for-each
											select="/soapenv:Envelope/soapenv:Body/v1:SearchAddressEBM/v1:DataArea/v1:SearchAddress/v1:Options/v11:OptionsOther/v11:COptimaOptionOther">
											<tns:COptimaOptionOther>
												<xsl:if test="@xsi:nil">
													<xsl:attribute name="nil"
														namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="@xsi:nil" />
                    </xsl:attribute>
												</xsl:if>
												<tns:OptionName>
													<xsl:value-of select="OptionName" />
												</tns:OptionName>
												<xsl:if test="OptionValue">
													<tns:OptionValue>
														<xsl:value-of select="OptionValue" />
													</tns:OptionValue>
												</xsl:if>
											</tns:COptimaOptionOther>
										</xsl:for-each>
									</tns:OptionsOther>
								</xsl:if>
							</tns:Options>
						</xsl:when>
						<xsl:otherwise>
							<tns:Options>
								<tns:Options>
									<tns:COptimaOption>
										<tns:OptionNumber>CarryStandardisationChanges</tns:OptionNumber>
										<tns:OptionValue>1</tns:OptionValue>
									</tns:COptimaOption>
								</tns:Options>
							</tns:Options>
						</xsl:otherwise>
					</xsl:choose>
				</tns:SearchAddressV2014Q1>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>
