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

      <xsl:template match="services">
            <xsl:text disable-output-escaping="yes" ><![CDATA[### Services TRANSGIRONDE ###
@prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:<http://www.w3.org/2002/07/owl#> .
@prefix xsd:<http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:<http://xmlns.com/foaf/0.1/> .
@prefix geo:<http://www.w3.org/2003/01/geo/wgs84_pos#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix transit:<http://vocab.org/transit/terms/> .
@prefix org:<http://data.datalocale.fr/org#> .]]>
            </xsl:text>
            <xsl:for-each-group select="service" group-by="trip_id">
                  <xsl:variable name="depart"><xsl:value-of select="current-group()[1]/departure_time"/></xsl:variable>
                  <xsl:variable name="arrivee"><xsl:value-of select="current-group()[last()]/arrival_time"/></xsl:variable>
eq:Service-1-<xsl:value-of select="trip_id"/>   
             org:heureDepart   <xsl:value-of select="$depart"/> ;    
             org:heureArrivee   <xsl:value-of select="$arrivee"/> ;    
             rdfs:label   <xsl:value-of select="$depart"/> - <xsl:value-of select="$arrivee"/> .
            </xsl:for-each-group>

            <xsl:for-each select="service">  
eq:Service-1-<xsl:value-of select="trip_id"/>                                         
            a  transit:Service ; 
            org:arret  eq:Arret-TRANSGIRONDE-<xsl:value-of select="stop_id"/> .
            </xsl:for-each>
      </xsl:template>

</xsl:stylesheet>
