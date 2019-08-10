<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
                doctype-system="about:legacy-compat"
                encoding="UTF-8"
                indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title><xsl:value-of select="article/head/title"/></title>
            </head>
            <body>
                <xsl:apply-templates select="/article/head"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>