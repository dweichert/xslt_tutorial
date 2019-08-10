<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
                doctype-system="about:legacy-compat"
                encoding="UTF-8"
                indent="yes" />

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title><xsl:value-of select="article/head/title"/></title>
            </head>
            <body>
                <xsl:apply-templates select="/article/head"/>
                <xsl:apply-templates select="/article/chapter"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="head/title">
        <h1 class="article-title"><xsl:value-of select="."/></h1>
    </xsl:template>

    <xsl:template match="head/subtitle">
        <h2 class="article-subtitle"><xsl:value-of select="."/></h2>
    </xsl:template>

    <xsl:template match="head/author">
        <p>von</p>
        <p class="article-author"><xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="chapter">
        <h3><xsl:value-of select="position()"/>.&#160;<xsl:value-of select="title"/></h3>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>