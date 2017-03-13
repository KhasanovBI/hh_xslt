<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <task>
            <xsl:apply-templates select="//task[@id='2']/*"/>
        </task>
    </xsl:template>

    <xsl:template match="cart">
        <xsl:copy>
            <xsl:apply-templates select="purchase">
                <xsl:sort select=".//cost" data-type="number" order="descending"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
