//
//  Entreprise.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 02/12/2021.
//


import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins


class Entreprise: ObservableObject {
    internal init(nomination: String, Siret: Int, dateeDebutActivite : String, domiciliation : String, secteur : SecteurDActivite, typeActivite : TypeDActivite, CA: Double, ACCRE : Reponses, activitePrincipal : Reponses, impot : Reponses, frequenceDeclURSSAF: FrequenceDeclarationURSSAF) {
        self.nomination = nomination
        self.Siret = Siret
        self.dateeDebutActivite = dateeDebutActivite
        self.domiciliation = domiciliation
        self.secteur = secteur
        self.typeActivite = typeActivite
        self.CA = CA
        self.ACCRE = ACCRE
        self.activitePrincipal = activitePrincipal
        self.impot = impot
        self.frequenceDeclURSSAF = frequenceDeclURSSAF
//        self.etapeEnCours = etapeEnCours
//        self.avancement = avancement
    }

    @Published var nomination: String
    @Published var Siret: Int
    @Published var dateeDebutActivite : String
    @Published var domiciliation : String
    @Published var secteur : SecteurDActivite
    @Published var typeActivite : TypeDActivite
    @Published var CA : Double
    @Published var ACCRE : Reponses
    @Published var activitePrincipal : Reponses
    @Published var impot : Reponses
    @Published var frequenceDeclURSSAF : FrequenceDeclarationURSSAF
    //PAS NECESSAIRES, TESTS POUR L'AVANCEMENT
//    @Published var etapeEnCours: Int
//    @Published var avancement: Avancement


}
var entrepriseParDefaut = Entreprise(nomination: "Mon Entreprise", Siret: 12345678901234, dateeDebutActivite: "15/03/2018", domiciliation: "Paris", secteur: .Artisanale, typeActivite: .ActiviteDeVente, CA: 5000.0, ACCRE: .non, activitePrincipal: .non, impot: .non, frequenceDeclURSSAF: .mensuel)

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

enum FrequenceDeclarationURSSAF: String {
    case mensuel = "mensuel"
    case trimestriel = "trimestre"
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

let context = CIContext()
let filter = CIFilter.qrCodeGenerator()
func generateQRCode(from string: String) -> UIImage {
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

struct Doc : Identifiable {
    var id = UUID()
    var texte: String
    var dateDoc: Date
}




//struct Document: View {
//    var element : Doc
//    var body: some View {
//        //Text(element.texte)
//        CardView(element: Doc(texte: element.texte))
//
//    }
//}
