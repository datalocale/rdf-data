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
            <xsl:text disable-output-escaping="yes" ><![CDATA[### CG33 - Colleges - Effectifs - 2012-11-27 ###
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix bpe:<http://rdf.insee.fr/def/territoire/bpe#> .
@prefix eq:<http://data.datalocale.fr/equipement/> .
@prefix org:<http://data.datalocale.fr/org#> .]]>
            </xsl:text>
            
        <xsl:for-each select="equipement">  
            <xsl:if test="SIXIEME!='_'">
eq:College-<xsl:value-of select="UAI"/>
            org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SIXIEME .     
        
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SIXIEME            
            rdf:type  org:Effectif ;
            rdfs:label "Effectif sixième (<xsl:value-of select="UAI"/>-2011)" ;
            org:effectifType  org:EffectifSixieme; 
            org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
            org:EffectifValeur  "<xsl:value-of select="SIXIEME"/>".
            </xsl:if>
              
            <xsl:if test="CINQUIEME!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-CINQUIEME .     
              
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-CINQUIEME            
              rdf:type  org:Effectif ;
              rdfs:label "Effectif cinquième (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifCinquieme; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="CINQUIEME"/>".
            </xsl:if>
              
              <xsl:if test="QUATRIEME!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-QUATRIEME .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-QUATRIEME            
              rdf:type  org:Effectif ;
              rdfs:label "Effectif quatrième (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifQuatrieme; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="QUATRIEME"/>".
              </xsl:if>
              
              <xsl:if test="TROISIEME!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME            
              rdf:type  org:Effectif ;
              rdfs:label "Effectif troisième (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTroisieme; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TROISIEME"/>".
              </xsl:if>
              
              <xsl:if test="TOTAL_ENS_GEN!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-ENS-GEN .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-ENS-GEN           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif total enseignement général (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTotalEnsGen ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TOTAL_ENS_GEN"/>".
              </xsl:if>
              
              <xsl:if test="UPI!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-UPI .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-UPI           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif UPI (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifUPI ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="UPI"/>".
              </xsl:if>
              
              <xsl:if test="SECTION_INTERNATIONAL!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SECTION-INTERNATIONAL .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SECTION-INTERNATIONAL           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif section internationale (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifSectionInter ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="SECTION_INTERNATIONAL"/>".
              </xsl:if>

              <xsl:if test="SECTION_EURO!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SECTION-EURO .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SECTION-EURO           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif section européenne (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifSectionEuro ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="SECTION_EURO"/>".
              </xsl:if>

              <xsl:if test="TECHNO!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TECHNO .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TECHNO           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif enseignement technologique (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTechno ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TECHNO"/>".
              </xsl:if>
              
              <xsl:if test="ENS_SPE!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-ENS-SPE .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-ENS-SPE           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif enseignement spécialisé (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifEnsSpe ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="ENS_SPE"/>".
              </xsl:if>
              
              <xsl:if test="TROISIEME_INSERTION!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME_INSERTION .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME_INSERTION          
              rdf:type  org:Effectif ;
              rdfs:label "Effectif troisième d'insertion (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTroisiemeInsertion ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TROISIEME_INSERTION"/>".
              </xsl:if>
                            
              <xsl:if test="TOTAL_HORS_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-HORS-SEGPA .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-HORS-SEGPA           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif total hors SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTotalHorsSEGPA ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TOTAL_HORS_SEGPA"/>".
              </xsl:if>
              
              <xsl:if test="SIXIEME_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SIXIEME-SEGPA .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-SIXIEME-SEGPA          
              rdf:type  org:Effectif ;
              rdfs:label "Effectif sixième SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifSixiemeSEGPA; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="SIXIEME_SEGPA"/>".
              </xsl:if>
              
              <xsl:if test="CINQUIEME_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-CINQUIEME-SEGPA.     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-CINQUIEME-SEGPA           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif cinquième SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifCinquiemeSEGPA; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="CINQUIEME_SEGPA"/>".
              </xsl:if>
              
              <xsl:if test="QUATRIEME_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-QUATRIEME-SEGPA.     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-QUATRIEME-SEGPA           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif quatrième SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifQuatriemeSEGPA; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="QUATRIEME_SEGPA"/>".
              </xsl:if>
              
              <xsl:if test="TROISIEME_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME-SEGPA.     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TROISIEME-SEGPA           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif troisième SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTroisiemeSEGPA; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TROISIEME_SEGPA"/>".
              </xsl:if>  
              
              <xsl:if test="TOTAL_SEGPA!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-SEGPA .     
              
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-TOTAL-SEGPA           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif total SEGPA (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifTotalSEGPA ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="TOTAL_SEGPA"/>".
              </xsl:if>

              <xsl:if test="BOURSIERS_ETAT!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-BOURSIERS-ETAT .     
                   
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-BOURSIERS-ETAT          
             rdf:type  org:Effectif ;
             rdfs:label "Effectif boursiers d'Etat (<xsl:value-of select="UAI"/>-2011)" ;
             org:effectifType  org:EffectifBoursiersEtat ; 
             org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="BOURSIERS_ETAT"/>".
              </xsl:if>

              <xsl:if test="BOURSIERS_CG!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-BOURSIERS-CG .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-BOURSIERS-CG           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif boursiers CG (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifBoursiersCG ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="BOURSIERS_CG"/>".
              </xsl:if>
              
              <xsl:if test="DEMI_PENSION!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-DP .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-DP           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif demi-pensionnaires (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType   org:EffectifDP ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="DEMI_PENSION"/>".
              </xsl:if>
              
              <xsl:if test="INTERNES!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-INTERNES .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-INTERNES           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif internes (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifInternes ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="INTERNES"/>".
              </xsl:if>
              
              <xsl:if test="INTERNES_EXTERNES!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-INTERNES-EXTERNES .     
                    
 eq:College<xsl:value-of select="UAI"/>-2011-Effectif-INTERNES-EXTERNES          
              rdf:type  org:Effectif ;
              rdfs:label "Effectif internes-externes (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifInternesExternes ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="INTERNES_EXTERNES"/>".
              </xsl:if>              
              
              <xsl:if test="EXTERNES!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-EXTERNES .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-EXTERNES           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif externes (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:EffectifExternes ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="EXTERNES"/>".
              </xsl:if>
              
              
              <xsl:if test="EXTERNES_SURVEILLES!='_'">
eq:College-<xsl:value-of select="UAI"/>
              org:effectifMesure  eq:College<xsl:value-of select="UAI"/>-2011-Effectif-EXTERNES-SURVEILLES .     
                    
eq:College<xsl:value-of select="UAI"/>-2011-Effectif-EXTERNES-SURVEILLES           
              rdf:type  org:Effectif ;
              rdfs:label "Effectif externes surveillés (<xsl:value-of select="UAI"/>-2011)" ;
              org:effectifType  org:effectifExternesSurveilles ; 
              org:anneeEffectif  "<xsl:value-of select="ANNEE"/>" ;
              org:EffectifValeur  "<xsl:value-of select="EXTERNES_SURVEILLES"/>".
              </xsl:if>
              
        </xsl:for-each>
      </xsl:template>

      <!-- FONCTIONS -->   
      
      
      <xsl:function name="fn:date">
            
            <xsl:param name="d"/>
            <xsl:value-of select="substring($d,7,4)"/>-<xsl:value-of select="substring($d,4,2)"/>-<xsl:value-of select="substring($d,1,2)"/>
            
      </xsl:function>

</xsl:stylesheet>
