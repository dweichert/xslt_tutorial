<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
                doctype-public="-//W3C//DTD HTML 4.01//EN"
                doctype-system="http://www.w3.org/TR/html4/strict.dtd"
                encoding="UTF-8"
                indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title><xsl:value-of select="article/head/title"/></title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>