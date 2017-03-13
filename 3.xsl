<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:key name="purchase_key" match="task[@id='3']//purchase" use="customer/@id"/>

    <xsl:template match="/">
        <task>
            <xsl:apply-templates select="//task[@id='3']"/>
        </task>
    </xsl:template>

    <xsl:template match="task">
        <cart>
            <xsl:apply-templates select="//purchase[generate-id(.)=generate-id(key('purchase_key', customer/@id))]"/>
        </cart>
    </xsl:template>

    <xsl:template match="purchase">
        <customer id="{customer/@id}">
            <amount>
                <xsl:value-of select="count(key('purchase_key', customer/@id))"/>
            </amount>
            <xsl:for-each select="key('purchase_key', customer/@id)">
                <xsl:sort select="product/cost" data-type="number" order="ascending"/>
                <purchase id="{@id}">
                    <product id="{product/@id}">
                        <cost>
                            <xsl:value-of select="product/cost"/>
                        </cost>
                        <amount>
                            <xsl:value-of select="product/amount"/>
                        </amount>
                    </product>
                </purchase>
            </xsl:for-each>
        </customer>
    </xsl:template>
</xsl:stylesheet>
