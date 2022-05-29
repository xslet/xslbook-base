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
    <h1><xsl:value-of select="/xslbook/title"/></h1>
    <xsl:apply-templates select="body" mode="xslbook">
     <xsl:with-param name="parent">xslbook</xsl:with-param>
    </xsl:apply-templates>
   </body>
  </html>
 </xsl:template>

</xsl:stylesheet>
