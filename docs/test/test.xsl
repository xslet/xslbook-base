<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:book="https://github.com/xslet/2020/xslbook"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:import href="res/dist/xslbook-base.xsl"/>

 <xsl:template match="/book">
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url"/>
  </xsl:variable>
  <html>
   <head>
    <meta charset="utf-8"/>
    <title>
     <xsl:apply-templates select="title">
      <xsl:with-param name="data_url" select="$_data_url"/>
     </xsl:apply-templates>
    </title>
   </head>
   <body>
    <xsl:apply-templates select="title" mode="xslbook-base">
     <xsl:with-param name="component_name">xslbook</xsl:with-param>
     <xsl:with-param name="component_index"/>
     <xsl:with-param name="html_element">h1</xsl:with-param>
     <xsl:with-param name="chapter_index"/>
     <xsl:with-param name="data_url" select="$_data_url"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="desc" mode="xslbook-base">
     <xsl:with-param name="component_name">xslbook</xsl:with-param>
     <xsl:with-param name="chapter_index"/>
     <xsl:with-param name="data_url" select="$_data_url"/>
    </xsl:apply-templates>

    <xsl:for-each select="chapter">
     <xsl:variable name="_ch_idx" select="position()"/>
     <xsl:variable name="_data_url2">
      <xsl:call-template name="book:get_data_url">
       <xsl:with-param name="data_url" select="$_data_url"/>
      </xsl:call-template>
     </xsl:variable>
     <xsl:apply-templates select="title" mode="xslbook-base">
      <xsl:with-param name="component_name">chapter</xsl:with-param>
      <xsl:with-param name="component_index" select="concat($_ch_idx, '. ')"/>
      <xsl:with-param name="html_element">h2</xsl:with-param>
      <xsl:with-param name="chapter_index" select="$_ch_idx"/>
      <xsl:with-param name="data_url" select="$_data_url2"/>
     </xsl:apply-templates>
     <xsl:apply-templates select="desc" mode="xslbook-base">
      <xsl:with-param name="component_name">chapter</xsl:with-param>
      <xsl:with-param name="chapter_index" select="$_ch_idx"/>
      <xsl:with-param name="data_url" select="$_data_url2"/>
     </xsl:apply-templates>

     <xsl:for-each select="section">
      <xsl:variable name="_sec_idx" select="position()"/>
      <xsl:variable name="_data_url3">
       <xsl:call-template name="book:get_data_url">
        <xsl:with-param name="data_url" select="$_data_url2"/>
       </xsl:call-template>
      </xsl:variable>
      <xsl:apply-templates select="title" mode="xslbook-base">
       <xsl:with-param name="component_name">section</xsl:with-param>
       <xsl:with-param name="component_index" select="concat($_ch_idx, '.', $_sec_idx, '. ')"/>
       <xsl:with-param name="html_element">h2</xsl:with-param>
       <xsl:with-param name="chapter_index" select="$_ch_idx"/>
       <xsl:with-param name="data_url" select="$_data_url3"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="desc" mode="xslbook-base">
       <xsl:with-param name="component_name">section</xsl:with-param>
       <xsl:with-param name="chapter_index" select="$_ch_idx"/>
       <xsl:with-param name="data_url" select="$_data_url3"/>
      </xsl:apply-templates>
     </xsl:for-each>
    </xsl:for-each>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="arg0">
  <xsl:param name="arg0"/>
  <xsl:value-of select="$arg0"/>
 </xsl:template>

</xsl:stylesheet>
