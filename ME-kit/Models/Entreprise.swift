//
//  Entreprise.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 02/12/2021.
//

import Foundation

struct Entreprise {
    var nomination: String
    var donneeDebutActivite : String
    var donneeDomiciliation : String
    var donneeTypeActivite : String
    var donneeACCRE : Reponses
    var donneeActivitePrincipal : Reponses
    var donneeImpot : Reponses
    var etapeEnCours: String
    var avancement: String
}


//source de donnÃ©es
var blocInfosMonEntreprise: Entreprise = Entreprise(nomination: "", donneeDebutActivite: "", donneeDomiciliation: "", donneeTypeActivite: "", donneeACCRE: .non, donneeActivitePrincipal: .non, donneeImpot: .non, etapeEnCours: "", avancement: "")

enum Reponses : String, CaseIterable {
    case oui = "oui"
    case non = "non"
}
