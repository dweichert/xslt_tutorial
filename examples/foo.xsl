<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml"/>

    <xsl:template match="/">
        <output>
            <xsl:apply-templates/>
        </output>
    </xsl:template>

    <xsl:template match="element">
        <item>
            <xsl:if test="@attribute">
                <attribute><xsl:value-of select="@attribute"/></attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </item>
    </xsl:template>

</xsl:stylesheet>
