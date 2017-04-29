<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>

    <head>
      <title>TPI NEXT from XML</title>
      <link href='/assets/style.css' type='text/css' rel='stylesheet' />
    </head>

    <body>
      <h1>TPI NEXT</h1>
      <table>

        <xsl:for-each select="tpinext/basedata/keyareas/keyarea">
          <xsl:variable name="keyarea" select="concat('ka', @nbr)" />
          <xsl:variable name="keyarea1" select="@nbr" />
          <tr class="keyareaheader">
            <td>
              <xsl:value-of select="@nbr" />
            </td>
            <td>
              <xsl:value-of select="@name" />
            </td>
            <td>
              <xsl:value-of select="count(/tpinext/basedata/checkpoints/checkpoint[@ka=$keyarea])" />
            </td>
          </tr>
          <tr class='overallstatement'>
            <td colspan='3'>
              <xsl:value-of select="./statements/statement[@level='overall']" />
            </td>
          </tr>
          <!--  checkpoints  -->
          <xsl:for-each select="/tpinext/basedata/checkpoints/checkpoint[@ka=$keyarea]">
            <xsl:if test="substring(@id,2) = 'C1'">
              <tr class='levelstatement'>
                <td>Controlled:</td>
                <td>
                  <xsl:value-of select="/tpinext/basedata/keyareas/keyarea[@nbr=$keyarea1]/statements/statement[@level='controlled']" />
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="substring(@id,2) = 'E1'">
              <tr class='levelstatement'>
                <td>Efficient:</td>
                <td>
                  <xsl:value-of select="/tpinext/basedata/keyareas/keyarea[@nbr=$keyarea1]/statements/statement[@level='efficient']" />
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="substring(@id,2) = 'O1'">
              <tr class='levelstatement'>
                <td>Optimizing:</td>
                <td>
                  <xsl:value-of select="/tpinext/basedata/keyareas/keyarea[@nbr=$keyarea1]/statements/statement[@level='optimizing']" />
                </td>
              </tr>
            </xsl:if>
            <tr class='checkpoint'>
              <td>
                <xsl:value-of select="@id" />
              </td>
              <td>
                <xsl:value-of select="." />
              </td>
              <td></td>
            </tr>
          </xsl:for-each>

        </xsl:for-each>
      </table>
    </body>

    </html>
  </xsl:template>

</xsl:stylesheet>
