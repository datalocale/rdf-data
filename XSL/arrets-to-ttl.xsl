<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:owl="http://www.w3.org/2002/07/owl#"
      xmlns:bpe="http://rdf.insee.fr/def/territoire/bpe#" 
      xmlns:skos="http://www.w3.org/2004/02/skos/core#"
      xmlns:fn="http://www.mondeca.com/xslt/functions">

      <xsl:output method="text" indent="yes" encoding="UTF-8"/>

      <xsl:template match="/">
            <xsl:apply-templates/>
      </xsl:template>

      <xsl:template match="arrets">
            <xsl:text disable-output-escaping="yes" ><![CDATA[### Arrets TRANSGIRONDE ###
@prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:<http://www.w3.org/2002/07/owl#> .
@prefix xsd:<http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:<http://xmlns.com/foaf/0.1/> .
@prefix geo:<http://www.w3.org/2003/01/geo/wgs84_pos#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix transit: <http://vocab.org/transit/terms/> .
@prefix org:<http://data.datalocale.fr/org#> .]]>
            </xsl:text>

            <xsl:for-each select="arret">  
eq:Arret-TRANSGIRONDE-<xsl:value-of select="stop_id"/>                                 
            a  transit:Stop ;
            rdfs:label  "<xsl:value-of select="stop_name"/>"@fr ;   
            geo:lat  "<xsl:value-of select="stop_lat"/>" ;
            geo:long  "<xsl:value-of select="stop_lon"/>" ;
            </xsl:for-each>
      </xsl:template>

</xsl:stylesheet>
