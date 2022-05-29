<?xml version="1.0" encoding="utf-8"?>                                          

<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:book="https://github.com/xslet/2020/xslbook">

 <!--**
  This match template is applied to <body> element for book texts or chapter texts.
  This @mode attribute has the value "xslbook".
  A <body> element has child elements, including XML data operation elements implemented in xslbook-do. And this template can have @data-src attribute to obtain data in an external XML file.
 -->
 <xsl:template match="body" mode="xslbook">
  <!--** A name of this parent element. -->
  <xsl:param name="parent"/>
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_id">
   <xsl:call-template name="book:get_id">
    <xsl:with-param name="data_url" select="$_data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <div class="body {$parent}-body">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:apply-templates select="child::node()[name() != 'attr']">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:apply-templates>
  </div>
 </xsl:template>


 <!--**
  This match template is applied to <body> element for texts of block elements.
  This @mode attribute has no value.
  A <body> element has child elements, including XML data operation elements implemented in xslbook-do. And this template can have @data-src attribute to obtain data in an external XML file.
 -->
 <xsl:template match="body">
  <!--** A name of this parent element. -->
  <xsl:param name="parent"/>
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <!--** A generated ID of a base node in a data source. -->
  <xsl:param name="data_gid"/>
  <!--** Index of parent <for> element. -->
  <xsl:param name="data_index"/>
  <!--** Index set of ancestor <for> element. -->
  <xsl:param name="data_indexes"/>
  <!--** Any argument 0. -->
  <xsl:param name="arg0"/>
  <!--** Any argument 1. -->
  <xsl:param name="arg1"/>
  <!--** Any argument 2. -->
  <xsl:param name="arg2"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
    <xsl:with-param name="data_index" select="$data_index"/>
    <xsl:with-param name="data_indexes" select="$data_indexes"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_data_gid">
   <xsl:call-template name="book:get_data_gid">
    <xsl:with-param name="data_gid" select="$data_gid"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_id">
   <xsl:call-template name="book:get_id">
    <xsl:with-param name="data_url" select="$data_url"/>
    <xsl:with-param name="data_gid" select="$data_gid"/>
    <xsl:with-param name="data_index" select="$data_index"/>
    <xsl:with-param name="data_indexes" select="$data_indexes"/>
    <xsl:with-param name="arg0" select="$arg0"/>
    <xsl:with-param name="arg1" select="$arg1"/>
    <xsl:with-param name="arg2" select="$arg2"/>
   </xsl:call-template>
  </xsl:variable>
  <div class="body {$parent}-body">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:apply-templates select="child::node()[name() != 'attr']">
    <xsl:with-param name="data_url" select="$_data_url"/>
    <xsl:with-param name="data_gid" select="$_data_gid"/>
    <xsl:with-param name="data_index" select="$data_index"/>
    <xsl:with-param name="data_indexes" select="$data_indexes"/>
    <xsl:with-param name="arg0" select="$arg0"/>
    <xsl:with-param name="arg1" select="$arg1"/>
    <xsl:with-param name="arg2" select="$arg2"/>
   </xsl:apply-templates>
  </div>
 </xsl:template>

</xsl:stylesheet>
