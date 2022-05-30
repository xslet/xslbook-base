<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:book="https://github.com/xslet/2020/xslbook"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:import href="res/dist/xslbook-base.xsl"/>

 <xsl:template match="/xslbook">
  <html>
   <head>
    <meta charset="utf-8"/>
    <title><xsl:value-of select="/xslbook/title"/></title>
   </head>
   <body>
    <h1><xsl:value-of select="title"/></h1>
    <xsl:apply-templates select="body" mode="chapter">
     <xsl:with-param name="chapter_type">xslbook</xsl:with-param>
    </xsl:apply-templates>
    <xsl:for-each select="chapter">
     <xsl:variable name="_ch_idx" select="position()"/>
     <h2><xsl:value-of select="title"/></h2>
     <xsl:apply-templates select="body" mode="chapter">
      <xsl:with-param name="chapter_type">chapter</xsl:with-param>
      <xsl:with-param name="chapter_index" select="$_ch_idx"/>
     </xsl:apply-templates>
    </xsl:for-each>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="arg0">
  <xsl:param name="arg0"/>
  <xsl:value-of select="$arg0"/>
 </xsl:template>

</xsl:stylesheet>
