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

      <xsl:template match="lignes">
            <xsl:text disable-output-escaping="yes" ><![CDATA[### Lignes et trajets TRANSGIRONDE ###
@prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:<http://www.w3.org/2002/07/owl#> .
@prefix xsd:<http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:<http://xmlns.com/foaf/0.1/> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix transit: <http://vocab.org/transit/terms/> .
@prefix org:<http://data.datalocale.fr/org#> .]]>
            </xsl:text>

eq:Agency-TRANSGIRONDE 
            a transit:Agency;
            rdfs:label   "TRANSGIRONDE" ;
            foaf:homepage    <xsl:text><![CDATA[<http://transgironde.gironde.fr/>]]></xsl:text>.

            <xsl:for-each select="ligne">  
                  <xsl:variable name="nom" select="route_short_name"/>
eq:Ligne-<xsl:value-of select="agency_id"/>-<xsl:value-of select="$nom"/>
                  <xsl:choose><xsl:when test="preceding-sibling::ligne[route_short_name=$nom]"/> <xsl:otherwise>                     
            a  org:Ligne ;
            rdfs:label  "<xsl:value-of select="substring-before(route_long_name,' - ')"/>"@fr ;</xsl:otherwise></xsl:choose>   
            org:trajet  eq:Route-<xsl:value-of select="agency_id"/>-<xsl:value-of select="route_id"/> .

eq:Route-<xsl:value-of select="agency_id"/>-<xsl:value-of select="route_id"/>
                  rdfs:label  "<xsl:value-of select="route_long_name"/>"@fr ; 
                  transit:agency   eq:Agency-TRANSGIRONDE .
            </xsl:for-each>
      </xsl:template>

</xsl:stylesheet>
