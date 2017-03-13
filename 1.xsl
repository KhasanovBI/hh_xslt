<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template match="/">
        <h2>Tasks</h2>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Description</th>
                <th>Entity</th>
            </tr>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="task[@id>1]">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="@desc"/></td>
            <td>
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="task//*[not(@id)]">
        &lt;<xsl:value-of select="name()"/>&gt;
        <xsl:apply-templates/>
        &lt;/<xsl:value-of select="name()"/>&gt;
    </xsl:template>

    <xsl:template match="task//*[@id]">
        &lt;<xsl:value-of select="name()"/> id=<xsl:value-of select="@id"/>&gt;
            <xsl:apply-templates/>
        &lt;/<xsl:value-of select="name()"/>&gt;
    </xsl:template>
</xsl:stylesheet>