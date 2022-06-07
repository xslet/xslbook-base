<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:book="https://github.com/xslet/2020/xslbook">

 <!--**
  This match template is applied to <desc> element of which a parent element is a component that cannot be included in XML data operation elements, such as <chapter> or <section>.
  @mode attribute of this template has the value "xslbook-base".
  <desc> elements that this template is applied to can have child elements, including XML data operation elements, and can have @data-src attribute to obtain data in an external XMl file.
 -->
 <xsl:template match="desc" mode="xslbook-base">
  <!--** The component name which uses this desc element. -->
  <xsl:param name="component_name"/>
  <!--** The cchapter index which is passed to child and descendant elements. -->
  <xsl:param name="chapter_index"/>
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_id">
   <xsl:call-template name="book:get_id">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <div class="desc {$component_name}-desc">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:apply-templates select="child::node()[name() != 'attr']">
    <xsl:with-param name="data_url" select="$_data_url"/>
    <xsl:with-param name="arg0" select="$chapter_index"/>
   </xsl:apply-templates>
  </div>
 </xsl:template>


 <!--**
  This match template is applied to <desc> element of which a parent element is a component that can be included in XML data operation elements, such as <item> of <dict>.
  @mode attribute of this template has the value "xslbook-do".
  <desc> elements that this template is applied to can have child elements, including XML data operation elements, and can have @data-src attribute to obtain data in an external XMl file.
 -->
 <xsl:template match="desc" mode="xslbook-do">
  <!--** The component name which uses this desc element. -->
  <xsl:param name="component_name"/>
  <!--** The chapter index which is passed to child and descendant elements. -->
  <xsl:param name="arg0"/>
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <!--** A generated ID of a base node in a data source. -->
  <xsl:param name="data_gid"/>
  <!--** Index of parent <for> element. -->
  <xsl:param name="data_index"/>
  <!--** Index set of ancestor <for> element. -->
  <xsl:param name="data_indexes"/>
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
  <div class="desc {$component_name}-desc">
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
