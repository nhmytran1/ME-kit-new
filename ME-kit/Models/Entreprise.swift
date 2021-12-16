
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins
import UniformTypeIdentifiers

class Entreprise: ObservableObject {
    internal init(nomination: String, Siret: Int, dateeDebutActivite : Date, domiciliation : Pays, secteur : SecteurDActivite, typeActivite : TypeDActivite, CA: Double, ACCRE : Reponses, activitePrincipal : Reponses, impot : Reponses, frequenceDecl: FrequenceDeclaration) {
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
        self.frequenceDecl = frequenceDecl
//        self.etapeEnCours = etapeEnCours
//        self.avancement = avancement
    }

    @Published var nomination: String
    @Published var Siret: Int
    @Published var dateeDebutActivite : Date
    @Published var domiciliation : Pays
    @Published var secteur : SecteurDActivite
    @Published var typeActivite : TypeDActivite
    @Published var CA : Double
    @Published var ACCRE : Reponses
    @Published var activitePrincipal : Reponses
    @Published var impot : Reponses
    @Published var frequenceDecl : FrequenceDeclaration
    //PAS NECESSAIRES, TESTS POUR L'AVANCEMENT
//    @Published var etapeEnCours: Int
//    @Published var avancement: Avancement

}

var entrepriseParDefaut = Entreprise(nomination: "GAFAZ", Siret: 123456789, dateeDebutActivite: Date(), domiciliation: .France, secteur: .Artisanale, typeActivite: .ActiviteDeVente, CA: 600000.0, ACCRE: .non, activitePrincipal: .oui, impot: .oui, frequenceDecl: .trimestriel)

enum Reponses : String, CaseIterable, Identifiable {
    
    case oui = "Oui"
    case non = "Non"
    
    var id: Reponses { self }
}
enum Pays : String, Identifiable, CaseIterable{
    case France = "France Métropolitaine"
    case DomTom = "DOM-TOM"
//    case Autre = "A l'Etranger"
    
    var id: Pays { self }
}
enum Avancement : String, CaseIterable, Identifiable {
    
    case creation = "Création"
    case suivi = "Suivi"
    case clôture = "Clôture"
    
    var id: Avancement { self }
}
enum SecteurDActivite : String, CaseIterable, Identifiable {
    
    case Commerciale = "Commerçant"
    case Artisanale = "Artisanat"
    case Liberales = "Libérales"
    //pas utilisés ?
//    case activitésAgricoles = "Activités Agricoles"
//    case Immobiliere = "Immobiler"
//    case Artiste = "Artiste"
    
    var id: SecteurDActivite { self }
}
enum TypeDActivite : String, CaseIterable, Identifiable {
    
    case ActiviteDeVente = "Activités de vente"
    case PrestationDeServices = "Prestation de services"
    case Mixte = "Mixte"
    
    var id: TypeDActivite { self }
}

enum FrequenceDeclaration: String, CaseIterable, Identifiable {
    case mensuel = "Mensuel"
    case trimestriel = "Trimestriel"
    
    var id: FrequenceDeclaration { self }
}

let formatSiret: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .none
    return formatter
}()
let formatCA: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    formatter.numberStyle = .none
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

struct Doc : Identifiable, Hashable {
    var id = UUID()
    var texte: String
    var dateDoc: Date
}

struct FilesDocuments: FileDocument {
    
    static var readableContentTypes: [UTType] { [.plainText] }
    
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}
