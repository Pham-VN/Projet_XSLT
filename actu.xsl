<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="DTD/xhtml1-strict.dtd" indent="yes" />
    <xsl:template match="/actu">
        <html>
            <head>
                <title>Actualités</title>
                <meta name="robots" content="noindex" />
                <link rel="stylesheet" type="text/css" href="actu.css" />
            </head>
            <body>
                <div class="theme">
                    <h2>Thème actu</h2>
                    <xsl:apply-templates select="breve[@theme='actu']" />
                    <h2>Thème sport</h2>
                    <xsl:apply-templates select="breve[@theme='sport']" />
                </div>
                <div class="count_breve">
                    <h1>ENTRAINER COUNT()</h1>
                    <div class="langue">
                        <h2>Brève en français</h2>
                        <xsl:value-of select="count(breve[@langue='fr'])"/>
                        <h2>Brève en anglais</h2>
                        <xsl:value-of select="count(breve[@langue='en'])"/>
                    </div>
                    <div class="activite">
                        <h2>Thème sport</h2>
                        <xsl:value-of select="count(breve[@theme='sport'])"/>
                        <h2>Thème actu</h2>
                        <xsl:value-of select="count(breve[@theme='actu'])"/>
                        <h2>Anne : 2014</h2>
                        <xsl:value-of select="count(breve[@date='7 décembre 2004'])"/>
                        <h2>Anne : 2016</h2>
                        <xsl:value-of select="count(breve[@date='7 février 2006'])"/>
                    </div>
               </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="breve">
                <div class="text">
                    <h2><xsl:value-of select="titre"/> (
                    <xsl:value-of select="@date"/>)</h2>
                    <xsl:apply-templates select="photo"></xsl:apply-templates>
                    <p style="margin-left:20px;"><xsl:value-of select="texte"/></p>
                   <ul><xsl:apply-templates select="url"></xsl:apply-templates></ul>  
                </div>
    </xsl:template>
    <xsl:template match="url">
        <li><a href="{@href}"><xsl:value-of select="."/></a></li>
    </xsl:template>
    <xsl:template match="photo">
        <img style="float:left; height:100px; width=150px; margin-right:20px; padding-bottom:20px" src="{@src}">
            <xsl:value-of select="."/>
        </img>
    </xsl:template>
             
</xsl:stylesheet>