import SwiftUI
import CoreImage.CIFilterBuiltins


struct StructureResumeInfos: View {
    @Binding var document: FilesDocuments
    @State private var emailAddress = "you@yoursite.com"
    @State var showingSheet : Bool = false
    var affichage : Bool
    @StateObject var entreprise = entrepriseParDefaut
    var body: some View {
        VStack {
            if affichage == true {
                HStack{
                    //                    Spacer()
                    NavigationLink(destination: ZoomQRCodeView(document: document)) {
                        
                        if document.message == "" {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .frame(width: 150, height: 150)
                                Text("Ajouter une carte de visite")
                                    .padding()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(Color("greenMEkit"))
                            }
                        } else {
                            Image(uiImage: generateQRCode(from: document.message))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .padding()
                        }
                    }
                    //IDEE DE BOUTON POUR QUE L'UTILISATEUR AILLE CHERCHER UNE IMAGE DEPUIS SON TEL
                    //                    Button(action: {
                    //                        isImporting = true
                    //
                    //                    }) {
                    //                        Image(systemName: "square.and.arrow.down")
                    //                            .resizable()
                    //                            .aspectRatio(contentMode: .fit)
                    //                            .opacity(0.5)
                    //                            .foregroundColor(.gray)
                    //                            .frame(width: 70, height: 70)
                    //                            .padding()
                    //                    }.fileImporter(
                    //                        isPresented: $isImporting,
                    //                        allowedContentTypes: [.plainText],
                    //                        allowsMultipleSelection: false
                    //                    ) { result in
                    //                        do {
                    //                            guard let selectedFile: URL = try result.get().first else { return }
                    //                            guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                    //
                    //                            document.message = message
                    //                        } catch {
                    //                            print ("Fail")
                    //                        }
                    //                    }
                }.padding()
            }
            VStack{
                if affichage == true {
                    //                    StructureRectangle(largueur: 350, hauteur: 350)
                    VStack {
                        HStack{
                            Text(entrepriseParDefaut.nomination)
                                .font(.title3)
                                .underline()
                                .padding(.leading, 20)
                            //                                .padding(.trailing, 20)
                            Spacer()
                            Button(){
                                showingSheet.toggle()
                            } label: {
                                Image (systemName: "pencil").font(.title3)
                                    .foregroundColor(Color("greenMEkit"))
                            }.padding()
                                .sheet(isPresented: $showingSheet) {
                                    Modifieur(donneeNom: entrepriseParDefaut.nomination, donneeLieu: entrepriseParDefaut.domiciliation, donneeSiret: entrepriseParDefaut.Siret, selectedType: entrepriseParDefaut.typeActivite, selectedSecteur: entrepriseParDefaut.secteur, selectedAccre: entrepriseParDefaut.ACCRE, selectedActivitePrincipal: entrepriseParDefaut.activitePrincipal, selectedImpot: entrepriseParDefaut.impot, selectedUrsaff: entrepriseParDefaut.frequenceDecl)
                                }
                            
                        }
                        StructureBlocInfosMonEntreprise(valeurSiret: entreprise.Siret, valeurDomiciliation: entreprise.domiciliation.rawValue, valeurDate: dateFormatter.string(from: entreprise.dateeDebutActivite), valeurFréquence: entreprise.frequenceDecl.rawValue, valeurSecteur: entreprise.secteur.rawValue, valeurType: entreprise.typeActivite.rawValue, valeurActPrincipal: entreprise.activitePrincipal.rawValue, valeurAccre: entreprise.ACCRE.rawValue, valeurImpot: entreprise.impot.rawValue)
                    }
                    
                    
                } else {
                    //                    StructureRectangle(largueur: 350, hauteur: 250)
                    StructureBlocInfosRevenu(valeurDate: dateFormatter.string(from: entreprise.dateeDebutActivite), valeurSecteur: entreprise.secteur.rawValue, valeurType: entreprise.typeActivite.rawValue, valeurAccre: entreprise.ACCRE.rawValue, valeurActPrincipal: entreprise.activitePrincipal.rawValue, valeurImpot: entreprise.impot.rawValue)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color("greenMEkit"))
            )
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
}
struct StructureResumeInfos_Previews: PreviewProvider {
    static var previews: some View {
        StructureResumeInfos(document: .constant(FilesDocuments(message: "")), affichage: true)
    }
}
//1 Rectangle
struct StructureRectangle: View {
    var largueur : CGFloat
    var hauteur : CGFloat
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                .foregroundColor(Color("greenMEkit"))
                .frame(width: largueur, height: hauteur)
        }.padding()
    }
}

//2 structure champs résumé
struct BlocInfos: View {
    
    var title:String
    var value:String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }.padding(.leading, 20)
            .padding(.trailing, 20)
    }
}
//3 Structure Du résumé d'information Mon Entreprise
struct StructureBlocInfosMonEntreprise: View {
    //    var valeurNomination : String
    var valeurSiret : Int
    var valeurDomiciliation : String
    var valeurDate : String
    var valeurFréquence : String
    var valeurSecteur : String
    var valeurType : String
    var valeurActPrincipal : String
    var valeurAccre : String
    var valeurImpot : String
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            //            BlocInfos(title: "Nomination :", value: valeurNomination)
            HStack {
                Text("Siret :")
                Spacer()
                Text("\(valeurSiret)")
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            BlocInfos(title: "Domiciliation :", value: valeurDomiciliation)
            BlocInfos(title: "Début d'activité le :", value: valeurDate)
            BlocInfos(title: "Fréquence déclaration :", value: valeurFréquence)
            BlocInfos(title: "Secteur d'activité :", value: valeurSecteur)
            BlocInfos(title: "Type d'activité :", value: valeurType)
            BlocInfos(title: "ACCRE :", value: valeurAccre)
            BlocInfos(title: "Activité Principal :", value: valeurActPrincipal)
            BlocInfos(title: "Impôt libératoire :", value: valeurImpot)
                .padding(.bottom, 15)
        }
    }
}
//3 Structure Du résumé d'information Mon Entreprise
struct StructureBlocInfosRevenu: View {
    var valeurDate : String
    var valeurSecteur : String
    var valeurType : String
    var valeurAccre : String
    var valeurActPrincipal : String
    var valeurImpot : String
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            BlocInfos(title: "Début d'activité le :", value: valeurDate)
                .padding(.top, 15)
            BlocInfos(title: "Secteur d'activité :", value: valeurSecteur)
            BlocInfos(title: "Type d'activité :", value: valeurType)
            BlocInfos(title: "ACCRE :", value: valeurAccre)
            BlocInfos(title: "Activité Principal :", value: valeurActPrincipal)
            BlocInfos(title: "Impôt libératoire :", value: valeurImpot)
                .padding(.bottom, 15)
        }
    }
}
struct ZoomQRCodeView : View {
    @State private var isImporting: Bool = false
    @State var document: FilesDocuments = FilesDocuments(message: "")
    var body : some View{
        VStack{
            Text("Ma Carte de Visite").font(.title).padding()
            Image(uiImage: generateQRCode(from: document.message))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            Button(action: {
                isImporting = true
            }) {
                Text("ajouter un document/lien")
            }.fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [.plainText],
                allowsMultipleSelection: false
            ) { result in
                do {
                    guard let selectedFile: URL = try result.get().first else { return }
                    guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                    
                    document.message = message
                } catch {
                    print ("Fail")
                }
            }
        }
    }
}
