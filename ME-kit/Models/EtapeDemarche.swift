//
//  EtapeDemarche.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 29/11/2021.
//

import Foundation

struct EtapeDemarche: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let url: String
    let documents: [Document]
    let category: DemarcheCategorie
}

enum DemarcheCategorie: String {
    case creation = "Création"
    case suivi = "Suivi"
    case cloture = "Clôture"
}

struct Document: Identifiable {
    let id = UUID()
    let docname: String
}


//source de données
var documentsNecessaires: [Document] = [
    Document(docname: "Extrait Kbis"),
    Document(docname: "Compte de résultat"),
    Document(docname: "Certificat publication annonces légales")
]

let etape1: EtapeDemarche = EtapeDemarche(name: "Inscription en ligne", description: "Comment s'inscrire en ligne blablabla", url:"https://www.google.fr" , documents: documentsNecessaires, category: .creation)
let etapeTVA: EtapeDemarche = EtapeDemarche(name: "Déclaration TVA", description: "En principe, en relevant de la micro-entreprise, vous ne facturez pas la TVA puisque vous bénéficiez du dispositif de \"franchise en base de TVA\". Vous ne déduisez donc pas de TVA. Vous devez alors mentionner sur vos factures : \"TVA non applicable, art. 293 B du CGI\". Vous pouvez néanmoins devenir redevable de la TVA : \r en optant pour un régime réel d'imposition à la TVA, ce qui vous permet de déduire la TVA sur vos achats ;\r en cas de dépassement des seuils de la franchise en base de TVA. Vous perdez en effet le bénéfice de la franchise en base de TVA : \r au 1er janvier N si vos chiffres d'affaires des années N-1 et N-2 ont excédé chacun la limite de 85 800€ (sans dépasser 94 300€) pour les activités de vente, ou 34 400€ (sans dépasser 36 500€) pour les prestations de service, \r dès le 1er jour du mois de dépassement si au cours de l'année civile, votre chiffre d'affaires excède le seuil de 94 300€ pour les activités de vente et de 36 500€ pour les activités de service. \r L'année de la création : la franchise s'applique de droit dès lors que le seuil de 94 300€ ou de 36 500€ n'est pas atteint (sans ajustement prorata temporis). \r L'année qui suit la création : pour déterminer si la franchise est applicable, les seuils doivent être proratisés en fonction de la durée d'activité pendant l'année de la création.\r Dès que vous perdez le bénéfice de la franchise en base de TVA, vous devez le signaler à votre service des impôts des entreprises, ce qui vous permettra ensuite de déclarer et payer la TVA dans votre espace professionnel.", url: "https://www.impots.gouv.fr/portail/professionnel/questions/en-tant-que-micro-entrepreneur-puis-je-etre-redevable-de-la-tva", documents: documentsNecessaires, category: .suivi)


var etapesCreation: [EtapeDemarche] = [
    etape1,
    EtapeDemarche(name: "La domiciliation", description: "Comment domicilier son entreprise blablabla", url:"https://www.google.fr", documents: documentsNecessaires, category: .creation),
    EtapeDemarche(name: "L'immatriculation", description: "Comment immatriculer sont entreprise blablabla", url:"https://www.google.fr", documents: documentsNecessaires, category: .creation)
]

var etapesSuivi: [EtapeDemarche] = [
    EtapeDemarche(name: "Déclaration URSSAF", description: "L'Union de Recouvrement pour la Sécurité Sociale et les Allocations Familiales (Urssaf) est un organisme de droit privé chargé de mission de service public. Elle s’inclut dans la branche \"recouvrement\" de la sécurité sociale. Cet organisme prend en charge de recueillir les cotisations sociales des auto-entrepreneurs. Et pour cela, il se base sur vos déclarations de chiffre d'affaires.", url: "https://www.autoentrepreneur.urssaf.fr/portail/accueil/gerer-mon-auto-entreprise.html", documents: documentsNecessaires, category: .suivi),
    EtapeDemarche(name: "Déclaration Impôts", description: "En tant que micro-entrepreneur (précédemment auto-entrepreneur), votre régime fiscal est celui de la micro-entreprise.\r Vous devez inscrire dans la déclaration de revenus (N° 2042-C-PRO) le montant de votre chiffre d'affaires (CA) ou de vos recettes brutes annuelles. Ce montant sera ensuite réduit automatiquement lors du calcul de votre impôt d'un montant forfaitaire (qui varie selon l’activité exercée par l’entreprise), à savoir : \r 71 % du CA pour les activités d'achat de biens destinés à être revendus en l'état, de fabrication de biens (en vue de leur vente), de produits à partir de matières premières (farine, métaux, bois, céramique...), de vente de denrées à consommer sur place, de fournitures de prestations d'hébergement ; \r 50 % du CA pour les autres activités industrielles et économiques ; \r 34 % du CA pour les activités libérales.", url:"https://www.impots.gouv.fr/portail/particulier/questions/comment-declarer-les-revenus-provenant-de-mon-activite-de-micro-entrepreneur", documents: documentsNecessaires, category: .suivi),
    EtapeDemarche(name: "Déclaration CFE", description: "Première étape si vous venez d’ouvrir votre auto-entreprise : remplir la déclaration initiale de CFE et la transmettre à votre Service des Impôts avant le 31 décembre de l’année de création de votre activité.\r En principe, les impôts doivent vous faire parvenir ce formulaire CFE par courrier. Mais si vous n’avez toujours rien reçu début décembre, nous vous invitons à télécharger ce document directement en ligne. Cette démarche est obligatoire. En cas de manquement de votre part, vous ne pourrez pas bénéficier de l’exonération de CFE au titre de votre 1ère année d’activité. Ce serait dommage !\r N’oubliez pas que vous ne paierez pas de CFE durant l’année de création de votre auto-entreprise (soit l’année de votre premier chiffre d’affaires). Vous pouvez donc remplir ce document sans craindre de devoir payer votre impôt dans la foulée. ", url: "https://www.portail-autoentrepreneur.fr/academie/statut-auto-entrepreneur/cotisation-fonciere-entreprises-cfe", documents: documentsNecessaires, category: .suivi)
]

