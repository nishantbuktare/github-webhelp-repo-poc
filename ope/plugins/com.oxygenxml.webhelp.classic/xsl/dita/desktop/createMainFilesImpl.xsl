<?xml version="1.0" encoding="UTF-8"?>
<!--
    
Oxygen Webhelp plugin
Copyright (c) 1998-2020 Syncro Soft SRL, Romania.  All rights reserved.

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
  xmlns:oxygen="http://www.oxygenxml.com/functions"
  xmlns:index="http://www.oxygenxml.com/ns/webhelp/index" exclude-result-prefixes="#all"
  version="2.0">

  <xsl:import href="../createMainFiles.xsl"/>

  <!--
     This parameter can be used to test the Webhelp distribution.
   -->
  <xsl:param name="WEBHELP_DISTRIBUTION" select="'classic'"/>
  
  <!-- 
    An unique(timestamp) ID for the current WebHelp transformation 
  -->
  <xsl:param name="WEBHELP_UNIQUE_ID"/>
  
  <!-- 
    Current oXygen build number. 
  -->
  <xsl:param name="WEBHELP_BUILD_NUMBER"/>
</xsl:stylesheet>
