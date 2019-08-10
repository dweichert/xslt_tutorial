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
                <xsl:call-template name="footnotes"/>
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

    <xsl:template match="chapter/title"/>

    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="blockquote">
        <blockquote>
            <xsl:apply-templates select="p"/>
            <xsl:apply-templates select="cite"/>
        </blockquote>
    </xsl:template>

    <xsl:template match="blockquote/cite">
        <cite>
            <xsl:if test="author">
                <xsl:value-of select="author/firstname"/>
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="author/lastname"/>
                <xsl:text>:&#160;</xsl:text>
            </xsl:if>
            <xsl:value-of select="title"/>
        </cite><sup><xsl:number level="any"/></sup>
    </xsl:template>

    <xsl:template match="cite">
        <sup><xsl:number level="any"/></sup>
    </xsl:template>

    <xsl:template name="footnotes">
        <hr/>
        <xsl:for-each select="//cite">
            <xsl:element name="p">
                <xsl:element name="sup">
                    <xsl:number level="any" count="cite"/>
                </xsl:element>
                <xsl:if test="author">
                    <xsl:apply-templates select="author"/>
                    <xsl:text>,&#160;</xsl:text>
                </xsl:if>
                <xsl:apply-templates select="title"/>
                <xsl:if test="subtitle">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:element name="em">
                        <xsl:value-of select="subtitle"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="publicationcity">
                    <xsl:apply-templates select="publicationcity"/>
                </xsl:if>
                <xsl:if test="publicationdate">
                    <xsl:apply-templates select="publicationdate"/>
                </xsl:if>
                <xsl:text>.</xsl:text>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="author">
        <xsl:value-of select="lastname"/>
        <xsl:text>,&#160;</xsl:text>
        <xsl:value-of select="firstname"/>
    </xsl:template>

    <xsl:template match="cite/title">
        <xsl:element name="em">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="publicationcity">
        <xsl:if test="position() = 1">
            <xsl:text>,&#160;</xsl:text>
        </xsl:if>
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">
            <xsl:text>,&#160;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="publicationdate">
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>