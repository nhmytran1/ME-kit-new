//
//  EtapeDemarche.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 29/11/2021.
//

import Foundation

struct EtapeDemarche: Identifiable {
    let id = UUID()
    let number: Int
    let name: String
    let description: String
    let url: String
    let echeance: String
    let duree: Int
    let dateDebut: String
    let dateFin: String
    let documents: [DocumentNecessaire]
    let info : String
    let category: DemarcheCategorie
}

enum DemarcheCategorie: String {
    case creation = "Création"
    case suivi = "Suivi"
    case cloture = "Clôture"
}

//tag pour chaque TabBarItem pour pouvoir choisir le TabBarItem actif
enum Tab: Hashable {
    case demarche
    case monEntreprise
    case revenuNet
}

struct DocumentNecessaire: Identifiable {
    let id = UUID()
    let docname: String
}
               
//source de données
var documentsNecessaires: [DocumentNecessaire] = [
    DocumentNecessaire(docname: "Extrait Kbis"),
    DocumentNecessaire(docname: "Compte de résultat"),
    DocumentNecessaire(docname: "Certificat publication annonces légales")
]


var etape1 : EtapeDemarche = EtapeDemarche(number: 1, name: "Inscription en ligne", description:
                    """
                    
                    La première étape du processus pour devenir micro-entrepreneur est simple : il s’agit d’une **inscription en ligne**, qui peut être effectuée sur les plateformes :
                    
                    - si votre activité est commerciale ou artisanale ou les deux :
                    [guichet-entreprises.fr](https://www.guichet-entreprises.fr)
                    
                    - si votre activité est libérale :
                    [lautoentrepreneur.fr](https://www.autoentrepreneur.urssaf.fr/portail/accueil/creer-mon-auto-entreprise.html)
                    
                    - si vous souhaitez être agent commercial :
                    [infogreffe.fr](https://www.infogreffe.fr)
                    
                    Votre déclaration sera ensuite traitée par le Centre de Formalités des Entreprises (CFE) suivant la nature et le lieu d'exercice de votre activité.
                    
                    Cette inscription permet d’informer l’administration fiscale et les organismes sociaux du démarrage de l’activité, et consiste à renseigner les informations suivantes:
                                           
                    - votre identité
                    - l’adresse pour recevoir des courriers
                    - l’adresse professionnelle où il est prévu d’exercer votre activité, s’il y en a une
                    - le type d’activité
                    - le choix des régimes fiscal et social
                    
                    L'inscription peut également se faire:
                    
                    - par **courrier**, après avoir envoyé le formulaire en ligne, vous pouvez envoyer une copie des documents justificatifs au CFE compétent de votre département ;
                    
                    - **sur place**, directement auprès du CFE spécifique à votre activité : **CCI** pour une activité commerciale, **CMA** pour les artisans ou l'**URSSAF** pour les professions libérales et pour une activité d'agent commercial au **greffe du tribunal de commerce** vous serez immatriculé au registre spécial des agents commerciaux (**RSAC**). Cette immatriculation est payante (26 € environ).
                    
                    """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                    
                    **Choix du statut juridique :**
                    
                    - Entreprise individuelle (EI)
                    - Entreprise individuelle à responsabilité limitée (EIRL)
                    - Entreprise unipersonnelle à responsabilité limitée (EURL) dont l'associé unique est une personne physique dirigeante de cette société avec option pour l'impôt sur le revenu
                    
                    Une fois votre dossier envoyé et validé, votre numéro SIRET vous parviendra sous 48h pour un envoi en ligne et environ 1 semaine par voie postale.
                    Il s’agit d’un code qui vous identifie en tant que professionnel. Ce numéro vous suivra tout au long de votre parcours d’auto-entrepreneur.
                    
                    Votre activité **doit** débuter dans les **30 jours** qui suivent l’envoi de votre dossier de déclaration de création d’auto-entreprise.
                    
                    *L’idéal est de démarrer à la réception de votre numéro SIRET*.
                    
                    """, category: .creation)

var etape2 : EtapeDemarche = EtapeDemarche(number: 2, name: "La domiciliation", description:
                                            """
                  
                  Toute création d’entreprise implique la domiciliation de cette dernière qui est déclarée au CFE (*Centre de formalité des entreprises*), soit:
                                  
                  - A son domicile.
                  
                  - En faisant appel à une société de domiciliation, c’est-à-dire à un prestataire de service fournissant une domiciliation juridique.
                  
                  - Via une pépinière d’entreprise ou un incubateur, qui donne aussi accès à de nombreux services et bureaux à des tarifs avantageux.
                  
                  - L’utilisation d’un local commercial, attention cela engage beaucoup de frais: loyer, factures à acquitter, coût d’entretien, etc.

                  """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                  Il n’existe **PAS** de déduction de ces charges sous le régime de la micro-entreprise.
                
                """, category: .creation)


var etape3 : EtapeDemarche = EtapeDemarche(number: 3, name: "L'immatriculation", description: """
                
                Dans le cas d'une activité :
                
                **- Commerciale:**
                l'immatriculation se fait au Registre du commerce et des sociétés (RCS).
                
                **- Artisanale ou mixte (commerciale et artisanale):**
                l'immatriculation se fait au Répertoire des métiers (RM) ou Chambres des Métiers et de l’artisanat.
                
                **- Libérale:**
                l’URSSAF sera alors l’organisme compétent.

                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Le site de l’administration française réservé au professionnels, propose un petit guide permettant de déterminer la nature de l’activité d’une entreprise, à retrouver sur [service-public-pro.fr](https://www.service-public.fr/professionnels-entreprises/vosdroits/F32887) .
                
                """, category: .creation)

var etape4 : EtapeDemarche = EtapeDemarche(number: 4, name: "Choix du régime social", description: """
                
                - Si vous êtes **déjà salarié(e)** à côté, vous êtes déjà affilié(e) au régime général de la Sécurité sociale et il est impossible de cumuler deux régimes sociaux.
                
                - Les **non-salarié(e)s** doivent **obligatoirement** choisir un régime social en fonction de la nature de l’activité qu’ils créent: pour les **professions libérales** réglementées il faut s'affilier à la **CIPAV** (*Caisse interprofessionnelle de prévoyance et d’assurance vieillesse*); pour les autres, à la **Sécurité sociale des indépendants** (ex-RSI).
                
                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Le statut social du micro-entrepreneur est celui de **Travailleur Non Salarié** (TNS), affilié à la sécurité sociale des indépendants.
                
                Chaque mois ou trimestre vous devez calculer et payer l'ensemble de vos **charges sociales** personnelles.
                Le calcul se fait en fonction de votre chiffre d'affaires réalisé au cours du mois ou du trimestre précédant cette déclaration :
                
                - **12,80 %** pour une activité d'achat/revente de marchandises, de vente de denrées à consommer sur place ou à emporter, ou de fourniture de logement hors location meublée autre qu'hôtel, chambre d'hôtes, meublé de tourisme, gite rural de tourisme ;
                - **22,00 %** pour les prestations de services prestations de services commerciales, artisanales et libérales (ne relevant pas de la CIPAV pour l'assurance-vieillesse) ;
                - **22,2 %** pour les activités libérales relevant de la CIPAV pour l'assurance-vieillesse - taux applicable à compter du 1er juillet 2021.
                
                A ces taux, s'ajoute une contribution pour la **formation professionnelle** :

                - **0,10%** pour les activités d'achat-revente de marchandises, ventes de denrées à emporter ou à consommer sur place et fourniture de logement hors location meublée autre qu'hôtel, chambre d'hôtes, meublé de tourisme et gite rural de tourisme
                - **0,30%** pour les activités artisanales
                - **0,20%** pour les prestations de services commerciales et les prestations de services libérales
                
                """, category: .creation)

var etape5 : EtapeDemarche = EtapeDemarche(number: 5, name: "Ouverture d'un compte bancaire", description: """
                
                L’ouverture d’un compte bancaire est obligatoire et il **doit impérativement** être **distinct** de votre compte personnel.

                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Vous n’êtes pas soumis à cette obligation, si vous créez une Entreprise Individuelle à Responsabilité Limitée (EIRL).
                
                Un compte bancaire courant suffit, vous n’etes pas tenu d’ouvrir un compte professionnel tel que vendu par les organismes bancaires.
                
                """, category: .creation)

var etape6 : EtapeDemarche = EtapeDemarche(number: 6, name: "Choix d'une assurance pro", description: """
                
                La souscription à une assurance professionnelle, dite **RC pro** (*Responsabilité Civile*), n’est pas obligatoire.
                
                Pour les activités de BTP, le professionnel **doit** souscrire une **assurance décennale** couvrant les potentiels dommages pouvant se produire après la fin des travaux.
                
                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Même si ce n'est pas obligatoire, le micro-entrepreneur a tout **intérêt** d’être couvert dès le lancement de son activité, en cas de dommages causés sur autrui dans le cadre de l’exercice de son activité.
                
                """, category: .creation)

var etape7 : EtapeDemarche = EtapeDemarche(number: 7, name: "Choix du versement libératoire", description: """
                
                Le versement fiscal libératoire est **optionnel** et se fait lors de **l'inscription**.
                
                Il permet de régler l’impôt tout au long de l’année, à mesure de l’encaissement du chiffre d’affaires et des côtisations sociales.

                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Il peut être mensuel ou trimestriel, son calcul se fait en fonction des montants du chiffre d’affaires ou des recettes hors taxe.
                
                """, category: .creation)

var etape8 : EtapeDemarche = EtapeDemarche(number: 8, name: "Obligations fiscales, comptables et déclaratives", description: """
                
                **Les plafonds de chiffre d'affaires:**
                
                    - Pour les activités artisanales :
                    **72 600€**
                    - Pour les activités commerciales:
                    **176 200€**
                
                **A noter:**
                
                - Si vous dépassez les seuils sur une seule année: vous pouvez garder le régime fiscal du micro-entrepreneur l'année de dépassement et la suivante.
                
                - Si vous dépassez les seuils pendant 2 années consécutives: au 1er janvier qui suit ces deux années, vous changerez de régime fiscal.
                Vous passez du régime de micro-entrepreneur au régime réel d'imposition pour les bénéfices industriels et commerciaux (BIC) ou au régime de la déclaration contrôlée pour les bénéfices non commerciaux (BNC).
                
                **La TVA:**
                                
                Les micro-entrepreneurs sont dispensés de la TVA que sur une partie de leur activité.
                Il existe 2 seuils de TVA selon l'activité : le premier est le seuil de franchise et le second le seuil majoré, dit de tolérance. Ils sont de:
                
                - pour les activités artisanales et prestations de services: **34 400€** et **36 500€**
                - pour les activités commerciales: **85 800€** et **94 300€**
                En bref:
                - en dessous du seuil de franchise : pas de TVA
                - au dessus du seuil majoré : il faut payer la TVA
                - entre le seuil de franchise et le seuil majoré : la première année pas de TVA à payer. Puis, tout dépendra du chiffre d’affaires de l’année suivante : s'il est inférieur au seuil de franchise, il sera à nouveau exonéré. En revanche, s’il est à nouveau compris entre entre le seuil de franchise et le seuil majoré, il faudra facturer la TVA aux clients dès le 1er janvier de l’année suivante puis la reverser à l’État par le biais de déclarations.
                
                Pas de seuil de tolérance la 1ère année d’activité, les calculs se font au prorata du temps d’exercice de l’activité.
                
                La TVA s'appliquera à compter du premier jour du mois au cours duquel le seuil est dépassé.
                
                **A noter:**
                
                Il faut renseigner la mention suivante: *« TVA non applicable, article 293 B du CGI »*,  sur ses factures (établies en deux exemplaires, dont l’une pour vous)
                Ce document doit contenir quelques informations bien précises , à savoir : votre identité et votre adresse, le nom commercial et l’enseigne, votre numéro SIRET, votre numéro RCS ou RM, la description du produit livré ou de la prestation réalisée, le prix Hors Taxe du produit ou service, la mention « TVA auto-entrepreneur non applicable », les informations relatives aux diverses assurances (RC Pro ou assurance décennale), le numéro de facture.
                La TVA facturée aux fournisseurs ne peut être récupérée.
                
                **Obligations comptables et fiscales:**
                
                Il faut justifier la nature de tous mouvements du compte relatif à la structure: seul l’enregistrement chronologique des recettes et des achats est exigé, en version numérique (par le biais d’un logiciel comptable) ou papier.
                
                - **Tenir un livre-journal des recettes:**
                Le livre des recettes contient l’ensemble des recettes encaissées et ce, chronologiquement. Doivent y figurer :  le **montant** et **l’origine** des recettes, le **mode de règlement**, et les **références** aux pièces justificatives.
                - **Tenir un registre des achats (en fonction de son activité):**
                Le registre des achats est un état récapitulatif des achats annuels effectués. Ce registre est *obligatoire pour certaines activités* (la vente de marchandises, fournitures et denrées, ou prestations d’hébergement). Doivent y figurer, pour chaque achat figurant dans ce registre : le **tiers** concerné, la **date** de l’opération, le **mode de règlement**, et les **références** des pièces justificatives (factures, tickets, etc).

                **Formalités fiscales et déclaratives:**
                
                Déclaration des recettes encaissées (mensuellement ou trimestriellement) ou indication du montant total des recettes encaissées sur la déclaration personnelle des revenus de l’année.
                Cette déclaration peut être effectuée en ligne, sur le site [autoentrepreneur.urssaf.fr](https://www.autoentrepreneur.urssaf.fr/portail/accueil.html)
                Il est à noter que cette déclaration est obligatoire dès que le chiffre d’affaires atteint la moitié du plafond légal. Dès que vos gains sont déclarés, le montant de vos **cotisations sociales**sera calculé automatiquement. Vous pourrez ensuite les régler en ligne.
                        
                """, url:"https://www.google.fr" , echeance: "", duree: 0, dateDebut: "", dateFin:"", documents: [], info: """
                
                Même si aucun chiffre d’affaires n'est généré, il est **obligatoire** de le déclarer. Pour une déclaration mensuelle (à effectuer 3 mois après la création de l’auto-entreprise) ou trimestrielle (à faire 6 mois après la création de l’auto-entreprise).
                
                *Il est important de bien suivre son chiffre d’affaires, car il permet non seulement de régler les cotisations ainsi que l’impôt sur le revenu, mais aussi d’envisager tous les axes d’amélioration.*
                
                En cas de retard ou de défaut de déclaration du chiffre d’affaires, vous encourez une **amende**.
                
                Par ailleurs, si votre chiffre d’affaires est nul pendant deux années consécutives, votre statut d’auto-entrepreneur sera **résilié**.

                Il est possibe d’éditer des factures dès que vous disposez de votre immatriculation.
                De nombreux logiciels de comptabilité et de facturation existent, et permettent encore une fois, d’alléger le travail administratif.
                
                """, category: .creation)

var etapesCreation: [EtapeDemarche] = [
    etape1,
    etape2,
    etape3,
    etape4,
    etape5,
    etape6,
    etape7,
    etape8
]


let etape9 : EtapeDemarche = EtapeDemarche(number: 9, name: "Déclaration URSSAF", description: "L'Union de Recouvrement pour la Sécurité Sociale et les Allocations Familiales (Urssaf) est un organisme de droit privé chargé de mission de service public. Elle s’inclut dans la branche \"recouvrement\" de la sécurité sociale. Cet organisme prend en charge de recueillir les cotisations sociales des auto-entrepreneurs. Et pour cela, il se base sur vos déclarations de chiffre d'affaires.", url: "https://www.autoentrepreneur.urssaf.fr/portail/accueil/gerer-mon-auto-entreprise.html", echeance: "mensuel", duree: 0, dateDebut: "", dateFin:"", documents: documentsNecessaires, info: "", category: .suivi)

let etape10 : EtapeDemarche = EtapeDemarche(number: 10, name: "Déclaration Impôts", description: "En tant que micro-entrepreneur (précédemment auto-entrepreneur), votre régime fiscal est celui de la micro-entreprise.\r Vous devez inscrire dans la déclaration de revenus (N° 2042-C-PRO) le montant de votre chiffre d'affaires (CA) ou de vos recettes brutes annuelles. Ce montant sera ensuite réduit automatiquement lors du calcul de votre impôt d'un montant forfaitaire (qui varie selon l’activité exercée par l’entreprise), à savoir : \r 71 % du CA pour les activités d'achat de biens destinés à être revendus en l'état, de fabrication de biens (en vue de leur vente), de produits à partir de matières premières (farine, métaux, bois, céramique...), de vente de denrées à consommer sur place, de fournitures de prestations d'hébergement ; \r 50 % du CA pour les autres activités industrielles et économiques ; \r 34 % du CA pour les activités libérales.", url:"https://www.impots.gouv.fr/portail/particulier/questions/comment-declarer-les-revenus-provenant-de-mon-activite-de-micro-entrepreneur", echeance: "trimestriel", duree: 0, dateDebut: "", dateFin:"", documents: documentsNecessaires, info: "", category: .suivi)

let etape11 : EtapeDemarche = EtapeDemarche(number: 11, name: "Déclaration CFE", description: "Première étape si vous venez d’ouvrir votre auto-entreprise : remplir la déclaration initiale de CFE et la transmettre à votre Service des Impôts avant le 31 décembre de l’année de création de votre activité.\r En principe, les impôts doivent vous faire parvenir ce formulaire CFE par courrier. Mais si vous n’avez toujours rien reçu début décembre, nous vous invitons à télécharger ce document directement en ligne. Cette démarche est obligatoire. En cas de manquement de votre part, vous ne pourrez pas bénéficier de l’exonération de CFE au titre de votre 1ère année d’activité. Ce serait dommage !\r N’oubliez pas que vous ne paierez pas de CFE durant l’année de création de votre auto-entreprise (soit l’année de votre premier chiffre d’affaires). Vous pouvez donc remplir ce document sans craindre de devoir payer votre impôt dans la foulée. ", url: "https://www.portail-autoentrepreneur.fr/academie/statut-auto-entrepreneur/cotisation-fonciere-entreprises-cfe", echeance: "15 décembre", duree: 0, dateDebut: "", dateFin:"", documents: documentsNecessaires, info: "", category: .suivi)

let etapesSuivi: [EtapeDemarche] = [
    etape9,
    etape10,
    etape11
]

let etapeTVA12: EtapeDemarche = EtapeDemarche(number: 12, name: "Déclaration TVA", description: "En principe, en relevant de la micro-entreprise, vous ne facturez pas la TVA puisque vous bénéficiez du dispositif de \"franchise en base de TVA\". Vous ne déduisez donc pas de TVA. Vous devez alors mentionner sur vos factures : \"TVA non applicable, art. 293 B du CGI\". Vous pouvez néanmoins devenir redevable de la TVA : \r en optant pour un régime réel d'imposition à la TVA, ce qui vous permet de déduire la TVA sur vos achats ;\r en cas de dépassement des seuils de la franchise en base de TVA. Vous perdez en effet le bénéfice de la franchise en base de TVA : \r au 1er janvier N si vos chiffres d'affaires des années N-1 et N-2 ont excédé chacun la limite de 85 800€ (sans dépasser 94 300€) pour les activités de vente, ou 34 400€ (sans dépasser 36 500€) pour les prestations de service, \r dès le 1er jour du mois de dépassement si au cours de l'année civile, votre chiffre d'affaires excède le seuil de 94 300€ pour les activités de vente et de 36 500€ pour les activités de service. \r L'année de la création : la franchise s'applique de droit dès lors que le seuil de 94 300€ ou de 36 500€ n'est pas atteint (sans ajustement prorata temporis). \r L'année qui suit la création : pour déterminer si la franchise est applicable, les seuils doivent être proratisés en fonction de la durée d'activité pendant l'année de la création.\r Dès que vous perdez le bénéfice de la franchise en base de TVA, vous devez le signaler à votre service des impôts des entreprises, ce qui vous permettra ensuite de déclarer et payer la TVA dans votre espace professionnel.", url: "https://www.impots.gouv.fr/portail/professionnel/questions/en-tant-que-micro-entrepreneur-puis-je-etre-redevable-de-la-tva", echeance: "avant le 1er mai", duree: 0, dateDebut: "", dateFin:"", documents: [], info: "", category: .suivi)


let etape13 : EtapeDemarche = EtapeDemarche(number: 13, name: "Cessation d'activité", description: """

**Etape 1: Déclaration cessation activité**

La déclaration de fermeture et radiation peut se faire:

- en ligne, pour toute forme d'entreprise juridique, sur [le site guichet-entreprises](https://www.guichet-entreprises.fr/fr/demarches_en_ligne/formalites.html)

- auprès de votre CFE, également en ligne ou **par courrier** en téléchargeant le formulaire correspondant (voir ci-dessous), le remplir et y joindre la copie de votre pièce d'identité (CNI ou passeport).
- si l'activité commerciale ou artisanale est immatriculé au RCS ou RM, il s’agit de la déclaration de radiation d’une personne physique P4 CMB, il est accessible sur le lien  [formulaire P4 CMB](https://www.service-public.fr/professionnels-entreprises/vosdroits/R17345) .
- sinon, il s’agit de la déclaration de modification ou de cessation d’activité P2-P4 micro-entrepreneur, disponible ici
[formulaire P2-P4](https://www.service-public.fr/professionnels-entreprises/vosdroits/R17542) .

A la réception du dossier de fermeture, le CFE transmet un accusé de réception.

**Etape 2: Déclaration du dernier chiffre d'affaires**

Dans tous les cas, il faut transmettre sa dernière déclaration de chiffre d’affaires, dans le mois suivant :
- la fermeture définitive, en cas de declaration mensuelle
- le trimestre civil de la fermeture définitive, en cas de déclaration trimestrielle

De plus, en cas de **NON** versement libératoire, vous devez adresser dans les **45 jours** qui suivent la cessation, une *déclaration de revenus n°2042* et la *déclaration complémentaire n°2042-C-PRO*, au service des impôts des particuliers dont vous dépendez.

**Etape 3: Le paiement du CFE**

Si vous en êtes redevable et si la cessation de la micro-entreprise a lieu:

**- en cours d'année:**
demander au service des impôts des entreprises (SIE) dont vous relevez la réduction de votre cotisation en fonction de votre temps d'activité, sur [Service des impôts des entreprises (SIE)](https://www.impots.gouv.fr/portail/contacts)
**- au 31 decembre:**
Il faut payer la totalité de la cotisation foncière des entreprises due pour l'année de cessation.

""", url: "https://www.guichet-entreprises.fr/fr/demarches_en_ligne/formalites.html", echeance: "", duree: 0, dateDebut: "", dateFin: "", documents: documentsNecessaires, info: "", category: .cloture)
