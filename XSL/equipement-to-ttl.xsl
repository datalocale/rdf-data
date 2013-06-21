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
            <xsl:text disable-output-escaping="yes" ><![CDATA[### CG33 - Equipements sportifs - 2012-11-22 ###
@prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl:<http://www.w3.org/2002/07/owl#> .
@prefix xsd:<http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix foaf:<http://xmlns.com/foaf/0.1/> .
@prefix dcterms:<http://purl.org/dc/terms/> .
@prefix igeo:<http://rdf.insee.fr/def/geo#> .
@prefix cog:<http://rdf.insee.fr/geo/> .
@prefix geo:<http://www.w3.org/2003/01/geo/wgs84_pos#> .
@prefix bpe:<http://rdf.insee.fr/def/territoire/bpe#> .
@prefix dul:<http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#> .
@prefix skos:<http://www.w3.org/2004/02/skos/core#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix typeq:<http://id.insee.fr/codes/territoire/TypeEquipement/>.
@prefix careq:<http://id.insee.fr/codes/territoire/CaractereEquipement/>.
@prefix org:<http://data.datalocale.fr/org#> .
@prefix adr:<http://schemas.talis.com/2005/address/schema#>.]]>
            </xsl:text>
            <xsl:for-each select="equipement">
            <xsl:variable name="pere"><xsl:value-of select="CodeEquipementPere"/></xsl:variable>      
            <xsl:variable name="typeNom"><xsl:value-of select="TypeEquipement"/></xsl:variable>
            <xsl:variable name="activite"><xsl:value-of select="Activite"/></xsl:variable>
            <xsl:variable name="type">
                  <xsl:choose>
                        <xsl:when test="document('onto-colleges-equip.rdf')/rdf:RDF/skos:Concept[skos:prefLabel=$typeNom]">
                              <xsl:value-of select="document('onto-colleges-equip.rdf')/rdf:RDF/skos:Concept[skos:prefLabel=$typeNom]/skos:notation"/>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="fn:iri($typeNom)"/></xsl:otherwise>
                  </xsl:choose>                  
            </xsl:variable>  
            <xsl:variable name="typeURI">
                  <xsl:choose>
                        <xsl:when test="document('onto-colleges-equip.rdf')/rdf:RDF/skos:Concept[skos:prefLabel=$typeNom]">typeq:<xsl:value-of select="$type"/></xsl:when>
                        <xsl:otherwise>eq:<xsl:value-of select="$type"/></xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="adr"><xsl:if test="NumeroRue!='_'"><xsl:value-of select="NumeroRue"/><xsl:text> </xsl:text></xsl:if><xsl:value-of select="Adresse"/></xsl:variable>
            <xsl:variable name="commune">
                  <xsl:value-of select="CommuneEquipement"/>
             </xsl:variable>
            <xsl:variable name="com">
                  <xsl:value-of select="document('liste-colleges.xml')/equipements/equipement[ADR_L6COMMUNE=$commune][1]/INSEE_COMMUNE"/>
            </xsl:variable>
            <xsl:variable name="gestion">
                  <xsl:value-of select="Gestionnaire"/>
            </xsl:variable>
            <xsl:variable name="proprio">
                  <xsl:value-of select="Proprietaire"/>
            </xsl:variable>
           <!-- Champs Gestionnaire et Proprietaire difficiles à interpréter,  des valeurs comme "commune" mais quelquefois "commune de ...", ou "association".
                        C'est donc quelquefois un type, quelquefois une entité nommée. Il faudrait des règles ad hoc  -->

eq:SportLoisir<xsl:value-of select="CodeEquipement"/>
            <xsl:if test="CodeEquipementPere!='-1'">
            dul:isComponentOf eq:SportLoisir<xsl:value-of select="CodeEquipementPere"/> ; </xsl:if>  
            rdfs:label  "<xsl:value-of select="Equipement"/>"@fr ;  
            dcterms:type  <xsl:value-of select="$typeURI"/>;<xsl:if test="MAJEquipement!='_'">
            org:dateMAJ   "<xsl:value-of select="fn:date(MAJEquipement)"/>"^^xsd:date ; </xsl:if><xsl:if test="$activite!='_'">
            org:activitePratiquee   eq:activite-<xsl:value-of select="fn:iri($activite)"/> ; </xsl:if>
            adr:streetAddress   "<xsl:value-of select="$adr"/>" ;
            adr:postalCode   "<xsl:value-of select="CodePostal"/>" ;
            adr:localityName   "<xsl:value-of select="CommuneEquipement"/>" ; <xsl:if test="$com!=''">
            geo:location   cog:COM_<xsl:value-of select="$com"/> ;  </xsl:if>  <xsl:if test="CoordX!='_'">
            bpe:coordonneesLambertX   "<xsl:value-of select="CoordX"/>" ; </xsl:if> <xsl:if test="CoordY!='_'">
            bpe:coordonneesLambertY   "<xsl:value-of select="CoordY"/>" ; </xsl:if> <xsl:if test="AccesMobRed='Oui'">
            bpe:caracterePresent   org:CaractereAccesMobiliteReduite ; </xsl:if> <xsl:if test="Eclairage!='Non éclairé'">
            bpe:caracterePresent   careq:ECLAIRE ; </xsl:if> 
            a  bpe:EquipementSportLoisir.
            <xsl:choose>
                  <xsl:when test="preceding-sibling::equipement[CodeEquipementPere=$pere]"/>
                  <xsl:when test="$pere='-1'"/>
                  <xsl:otherwise>
eq:SportLoisir<xsl:value-of select="$pere"/>
            a  bpe:EquipementSportLoisir ;
            rdfs:label  "<xsl:value-of select="EquipementPere"/>"@fr .
                  </xsl:otherwise>
            </xsl:choose>           
            <xsl:choose>
                   <xsl:when test="preceding-sibling::equipement[TypeEquipement=$typeNom]"/>
                    <xsl:when test="document('onto-colleges-equip.rdf')/rdf:RDF/skos:Concept[skos:prefLabel=$typeNom]"/>
                    <xsl:otherwise>
eq:<xsl:value-of select="$type"/>
            a  bpe:TypeEquipementSportLoisir ;
            skos:prefLabel  "<xsl:value-of select="$typeNom"/>"@fr .
                    </xsl:otherwise>
            </xsl:choose>  
            <xsl:choose>
                  <xsl:when test="preceding-sibling::equipement[Activite=$activite]"/>
                  <xsl:otherwise>
eq:activite-<xsl:value-of select="fn:iri($activite)"/>
            a  org:Activite ;
            skos:prefLabel  "<xsl:value-of select="$activite"/>"@fr .
                  </xsl:otherwise>
            </xsl:choose>
            </xsl:for-each>
      </xsl:template>

      <!-- FONCTIONS -->   
      
      <xsl:function name="fn:iri">
            
            <xsl:param name="c"/>
            <xsl:variable name="c0"><xsl:value-of select="lower-case(replace($c,'\W+','-'))"/></xsl:variable>
            <xsl:variable name="c1"><xsl:value-of select="lower-case(replace($c0,'\+','-'))"/></xsl:variable>
            <xsl:variable name="c2"><xsl:value-of select="replace($c1,'à','a')"/></xsl:variable>
            <xsl:variable name="c3"><xsl:value-of select="replace($c2,'â','a')"/></xsl:variable>
            <xsl:variable name="c4"><xsl:value-of select="replace($c3,'ä','a')"/></xsl:variable>
            <xsl:variable name="c5"><xsl:value-of select="replace($c4,'ç','c')"/></xsl:variable>
            <xsl:variable name="c6"><xsl:value-of select="replace($c5,'é','e')"/></xsl:variable>
            <xsl:variable name="c7"><xsl:value-of select="replace($c6,'è','e')"/></xsl:variable>
            <xsl:variable name="c8"><xsl:value-of select="replace($c7,'ê','e')"/></xsl:variable>
            <xsl:variable name="c9"><xsl:value-of select="replace($c8,'ë','e')"/></xsl:variable>
            <xsl:variable name="c10"><xsl:value-of select="replace($c9,'î','i')"/></xsl:variable>
            <xsl:variable name="c11"><xsl:value-of select="replace($c10,'ï','i')"/></xsl:variable>
            <xsl:variable name="c12"><xsl:value-of select="replace($c11,'ô','o')"/></xsl:variable>
            <xsl:variable name="c13"><xsl:value-of select="replace($c12,'ö','o')"/></xsl:variable>
            <xsl:variable name="c14"><xsl:value-of select="replace($c13,'ù','u')"/></xsl:variable>
            <xsl:variable name="c15"><xsl:value-of select="replace($c14,'û','u')"/></xsl:variable>
            <xsl:variable name="c16"><xsl:value-of select="replace($c15,'ü','u')"/></xsl:variable>
            <xsl:variable name="c17"><xsl:value-of select="substring($c16,1,200)"/></xsl:variable>
            <xsl:value-of select="$c17"/>
            
      </xsl:function>
      
      <xsl:function name="fn:date">
            
            <xsl:param name="d"/>
            <xsl:value-of select="substring($d,1,4)"/>-<xsl:value-of select="substring($d,5,2)"/>-<xsl:value-of select="substring($d,7,2)"/>
            
      </xsl:function>

</xsl:stylesheet>
