//
//  Entreprise.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 02/12/2021.
//


import Foundation
import SwiftUI
import Combine

struct Entreprise {
    var nomination: String
    //var image : UIImage?
    var Siret : Int
    var dateeDebutActivite : String
    var domiciliation : String
    var secteur : SecteurDActivite
    var typeActivite : TypeDActivite
    var ACCRE : Reponses
    var activitePrincipal : Reponses
    var impot : Reponses
    var etapeEnCours: String
    var avancement: Avancement
}

var entrepriseParDefaut = Entreprise(nomination: "Mon Entreprise", Siret:  34567556078978, dateeDebutActivite: "15/03/2018", domiciliation: "Paris", secteur: .Artisanale, typeActivite: .ActiviteDeVente, ACCRE: .non, activitePrincipal: .non, impot: .non, etapeEnCours: "", avancement: .creation)

enum Reponses : String, CaseIterable, Identifiable {
    
    case oui = "oui"
    case non = "non"
    
    var id: Reponses { self }
}
enum Avancement : String, CaseIterable, Identifiable {
    
    case creation = "Création"
    case suivi = "Suivi"
    case clôture = "Clôture"
    
    var id: Avancement { self }
}
enum SecteurDActivite : String, CaseIterable, Identifiable {
    
    case Commerciale = "Commerçant/Commerçante"
    case Artisanale = "Artisant/Artisante"
    case Liberales = "Libéraux/Libérales"
    case activitésAgricoles = "Activités Agricoles"
    case Immobiliere = "Immobiler"
    case Artiste = "Artiste"
    
    var id: SecteurDActivite { self }
}
enum TypeDActivite : String, CaseIterable, Identifiable {
    
    case ActiviteDeVente = "activités de vente"
    case PrestationDeServices = "Prestation de services"
    case Mixte = "les deux(Ventes et Service)"
    
    var id: TypeDActivite { self }
}
let formatSiret: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
}()
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.locale = Locale(identifier: "fr")
    return formatter
}()
struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}


struct Doc : Identifiable {
    var id = UUID()
    var texte: String
}

//struct Document: View {
//    var element : Doc
//    var body: some View {
//        //Text(element.texte)
//        CardView(element: Doc(texte: element.texte))
//
//    }
//}
