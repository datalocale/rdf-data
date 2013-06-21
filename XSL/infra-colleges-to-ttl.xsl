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

      <xsl:template match="equipements">
            <xsl:text disable-output-escaping="yes" ><![CDATA[### CG33 - Colleges - Infrastructures - 2012-11-27 ###
@prefix bpe:<http://rdf.insee.fr/def/territoire/bpe#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix org:<http://data.datalocale.fr/org#> .]]>
            </xsl:text>
            
            <xsl:for-each select="equipement[NB_CLASSES_OUVERTES!='_']">  
eq:College-<xsl:value-of select="UAI"/>
             <!-- A remplacer par le futur champ "Libellé" -->
                 <xsl:if test="CAPACITE_THEORIQUE!='_'">
            org:capaciteTheorique "<xsl:value-of select="CAPACITE_THEORIQUE"/>" ;</xsl:if> 
                  <xsl:if test="SURFACE_BATI!='_'">  
            org:surfaceBati "<xsl:value-of select="SURFACE_BATI"/>" ;</xsl:if> 
                  <xsl:if test="SURFACE_NONBATI!='_'">  
            org:surfaceNonBati "<xsl:value-of select="SURFACE_NONBATI"/>" ;</xsl:if>  
                  <xsl:if test="REF_TYPE_CUISINE='A'"> 
            bpe:caracterePresent  org:CaractereCuisineAUTOG ;   </xsl:if>
                  <xsl:if test="REF_TYPE_CUISINE='C'"> 
            bpe:caracterePresent  org:CaractereCuisineCONV-EPLE ;   </xsl:if>
                  <xsl:if test="REF_TYPE_CUISINE='O'"> 
            bpe:caracterePresent  org:CaractereCuisineAUTRE ;   </xsl:if>
            org:nbClassesOuvertes  "<xsl:value-of select="NB_CLASSES_OUVERTES"/>" .                  
            </xsl:for-each>
      </xsl:template>

      <!-- FONCTIONS -->   
      
      
      <xsl:function name="fn:date">
            
            <xsl:param name="d"/>
            <xsl:value-of select="substring($d,7,4)"/>-<xsl:value-of select="substring($d,4,2)"/>-<xsl:value-of select="substring($d,1,2)"/>
            
      </xsl:function>

</xsl:stylesheet>
