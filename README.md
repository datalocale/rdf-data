modélisation en RDF de la fiche collège de la Gironde
========

Le département de la Gironde construit et entretient un certin nombre de collège d'enseignement secondaire sur le territoire du données dont elle a la charge administrative
Elle met également en oeuvre une offre de transport en autocar quotidiennement utilisé par les collègiens pour se 
rendre dans leur établissement scolaire.
Dans le cadre des enseignements mis en oeuvre par le ministère de l'éducation nationale, les aactivités sportives se déroulent dans des équipements 
sportifs situés à proximité de ces équipements scolaires.
En complément de l'approche traditionnelle agrégant des inforamtions de gestion au sein d'un système d'information déceisionnel, le département de la Gironde
a souhaité expérimenter l'utilisation des technologies du web de données pour agréger des données provenant de sources disparates
Avec l'assistance technique et méthodologique de la société Mondeca, le département de la Gironde publie le résultat de cette expérimentation qui peut être transposée dans d'autres territoires similaires

========
Ce dépôt contient :
- les données sources publiées sur le portail http://catalogue.datalocale.fr en csv et transformée en XML
- les feuilles de transformation xsl permettant de les transformer en fichiers RDF turtle
- l'ontologie produite par Mondeca
  i.onto-colleges-v1.2-2013-05-24.ttl : Modèle des données Collèges, intégrant l'ontologie de la base des équipements (BPE) de l'INSEE, une partie de l'ontologie "Transit" pour les transports
  ii.Ontologie géographique de l'INSEE, révision de décembre 2012.
- l'export des données chargées dans l'entrepôt RDF sesame utilisé pour l'expérimentation
  - Référentiel cantons et communes du 33, avec leurs identifiants INSEE, récupérés de la publication RDF de l'INSEE. 
  - Fichiers .ttl obtenus par transformation des fichiers CSV d'origine via transformation en XML puis XLST :
  COLLEGES
    liste-colleges.ttl : liste des collèges avec coordonnées, libellés, localisation
    infra-colleges.ttl : description des collèges en tant qu'infrastructures
    effectifs-colleges.ttl : description des effectifs
  EQUIPEMENTS
    equipements.ttl : base d'équipements du département (indépendants des collèges)
    equipements-wgs84.ttl : localisation des équipements en WGS 84
  TRANSPORTS (représentés avec l'ontologie Transit)
    lignes.ttl : lignes de bus
    arrets.ttl : arrêts de bus
    trajets.ttl : trajets de bus
    services.ttl : services de bus
    colleges-arrets-bus-only.rdf

L'ensemble de ces contenu est publié sous licence CC-By-SA
