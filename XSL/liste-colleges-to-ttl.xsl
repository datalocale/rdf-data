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
            <xsl:text disable-output-escaping="yes" ><![CDATA[### CG33 - Colleges - 2012-11-27 ###
@prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:<http://www.w3.org/2002/07/owl#> .
@prefix xsd:<http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:<http://xmlns.com/foaf/0.1/> .
@prefix dcterms:<http://purl.org/dc/terms/> .
@prefix geo:<http://www.w3.org/2003/01/geo/wgs84_pos#> .
@prefix igeo:<http://rdf.insee.fr/def/geo#> .
@prefix cog:<http://rdf.insee.fr/geo/> .
@prefix bpe:<http://rdf.insee.fr/def/territoire/bpe#> .
@prefix sect:<http://id.insee.fr/codes/territoire/Secteur/> .
@prefix dul:<http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#> .
@prefix skos:<http://www.w3.org/2004/02/skos/core#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix typeq:<http://id.insee.fr/codes/territoire/TypeEquipement/>.
@prefix org:<http://data.datalocale.fr/org#> .
@prefix adr:<http://schemas.talis.com/2005/address/schema#>.]]>
            </xsl:text>
            
            <xsl:for-each select="equipement">  
eq:College-<xsl:value-of select="UAI"/>
             <!-- A remplacer par le futur champ "Libellé" -->
            rdfs:label  "<xsl:value-of select="ADR_L1"/>"@fr ; <xsl:if test="NOM_LONG!='_'">
            org:nomLong "<xsl:value-of select="NOM_LONG"/>"@fr ;</xsl:if> 
                  <xsl:if test="NOM_COURT!='_'">  
            org:nomCourt "<xsl:value-of select="NOM_COURT"/>"@fr ; </xsl:if>
            adr:streetAddress   "<xsl:value-of select="ADR_L4VOIE"/>" ;
            adr:postalCode   "<xsl:value-of select="ADR_L6CP"/>" ;
            adr:localityName   "<xsl:value-of select="ADR_L6COMMUNE"/>" ;
            geo:location   cog:COM_<xsl:value-of select="INSEE_COMMUNE"/> ; <xsl:if test="CONTRAT='PUBLIC'">
            a  org:CollegePublic ;
            bpe:secteur  sect:Public; </xsl:if>  <xsl:if test="CONTRAT='PRIVE'">
            a  org:CollegePrive ;
            bpe:secteur  sect:Prive; </xsl:if> 
                  <xsl:if test="TEL!='_'"> 
            org:telephone  "<xsl:value-of select="TEL"/>" ;   </xsl:if> 
                  <xsl:if test="FAX!='_'"> 
            org:fax  "<xsl:value-of select="FAX"/>" ;   </xsl:if> 
                  <xsl:if test="MAIL!='_'"> 
            org:mail  "<xsl:value-of select="MAIL"/>" ;   </xsl:if> 
                  <xsl:if test="N_ZAP!='_'"> 
            org:numZap  "<xsl:value-of select="N_ZAP"/>" ;   </xsl:if>
                  <xsl:if test="N_SECTEUR!='_'"> 
            org:numSecteur  "<xsl:value-of select="N_SECTEUR"/>" ;   </xsl:if>
                  <xsl:if test="RRS!='_'"> 
            org:RRS  "true" ;   </xsl:if>
                  <xsl:if test="SEGPA='1'"> 
            bpe:caracterePresent  org:CaractereSegpa ;   </xsl:if>
                  <xsl:if test="UPI='1'"> 
            bpe:caracterePresent  org:CaractereUPI ;   </xsl:if>  
                  <xsl:if test="SECTION_INTERNATIONAL='1'"> 
            bpe:caracterePresent  org:CaractereSectionInter ;   </xsl:if>
                  <xsl:if test="SECTION_EURO='1'"> 
            bpe:caracterePresent  org:CaractereSectionEuro ;   </xsl:if>
                  <xsl:if test="TECHNO='1'"> 
            bpe:caracterePresent  org:CaractereSectionTechno ;   </xsl:if>
                  <xsl:if test="ENS_SPE='1'"> 
            bpe:caracterePresent  org:CaractereEnsSpe ;   </xsl:if>
                  <xsl:if test="HEBERGEMENT_ETAB_CODE='12'"> 
            bpe:caracterePresent  org:CaractereDP ;   </xsl:if>
                  <xsl:if test="HEBERGEMENT_ETAB_CODE='22'"> 
            bpe:caracterePresent  typeq:INT ;   </xsl:if>
                   <xsl:if test="DATEOUVERTURE!='_'"> 
            org:dateOuverture  "<xsl:value-of select="fn:date(DATEOUVERTURE)"/>"  ;   </xsl:if>
                  <xsl:if test="LATITUDE!='_'"> 
            geo:lat  "<xsl:value-of select="LATITUDE"/>"  ;   </xsl:if>
                  <xsl:if test="LONGITUDE!='_'"> 
            geo:long  "<xsl:value-of select="LONGITUDE"/>"  ;   </xsl:if>
                  <xsl:if test="ANNEE!='_'"> 
            bpe:anneeDescription  "<xsl:value-of select="ANNEE"/>"  ;   </xsl:if>
            a  bpe:EquipementScolaire ;
            dcterms:type  typeq:C201.                 
            </xsl:for-each>
      </xsl:template>

      <!-- FONCTIONS -->   
      
      <xsl:function name="fn:date">
            
            <xsl:param name="d"/>
            <xsl:value-of select="substring($d,7,4)"/>-<xsl:value-of select="substring($d,4,2)"/>-<xsl:value-of select="substring($d,1,2)"/>
            
      </xsl:function>

</xsl:stylesheet>
