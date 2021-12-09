//
//  ResumeInfo.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 01/12/2021.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct StructureResumeInfos: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    @State var showingSheet : Bool = false
    var affichage : Bool
    @StateObject var entreprise = entrepriseParDefaut
    var body: some View {
        VStack {
            TextField("Name", text: $name).padding(.leading)
            
            TextField("Email address", text: $emailAddress).padding(.leading)
            NavigationLink(destination: ZoomQRCodeView(name: name, emailAddress: emailAddress)) {
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            ZStack{
                if affichage == true {
                    StructureRectangle(largueur: 350, hauteur: 300)
                    VStack {
                        HStack{
                            Text(entreprise.nomination).padding(.leading, 20)
                                .padding(.trailing, 20)
                            Spacer()
                            Button(){
                                showingSheet.toggle()
                            } label: {
                                Image (systemName: "pencil").font(.title3)
                                    .foregroundColor(Color("greenMEkit"))
                            }
                            .sheet(isPresented: $showingSheet) {
                                Modifieur(donneeNom: entrepriseParDefaut.nomination, donneeLieu: entrepriseParDefaut.domiciliation, donneeSiret: entrepriseParDefaut.Siret, selectedType: entrepriseParDefaut.typeActivite, selectedSecteur: entrepriseParDefaut.secteur, selectedAccre: entrepriseParDefaut.ACCRE, selectedActivitePrincipal: entrepriseParDefaut.activitePrincipal, selectedImpot: entrepriseParDefaut.impot)
                            }.padding(.leading, 20)
                                .padding(.trailing, 20)
                        }.padding()
                        StructureBlocInfosMonEntreprise(valeurNomination: entreprise.nomination, valeurSiret: entreprise.Siret, valeurDomiciliation: entreprise.domiciliation, valeurDate: entreprise.dateeDebutActivite, valeurSecteur: entreprise.secteur.rawValue, valeurType: entreprise.typeActivite.rawValue, valeurActPrincipal: entreprise.activitePrincipal.rawValue, valeurAccre: entreprise.ACCRE.rawValue, valeurImpot: entreprise.impot.rawValue)
                    }
                } else {
                    StructureRectangle(largueur: 350, hauteur: 250)
                    StructureBlocInfosRevenu(valeurDate: entreprise.dateeDebutActivite, valeurSecteur: entreprise.secteur.rawValue, valeurType: entreprise.typeActivite.rawValue, valeurAccre: entreprise.ACCRE.rawValue, valeurActPrincipal: entreprise.activitePrincipal.rawValue, valeurImpot: entreprise.impot.rawValue)
                }
            }
        }
    }
}
struct StructureResumeInfos_Previews: PreviewProvider {
    static var previews: some View {
        StructureResumeInfos(affichage: true)
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
    var valeurNomination : String
    var valeurSiret : Int
    var valeurDomiciliation : String
    var valeurDate : String
    var valeurSecteur : String
    var valeurType : String
    var valeurActPrincipal : String
    var valeurAccre : String
    var valeurImpot : String
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            BlocInfos(title: "Nomination :", value: valeurNomination)
            HStack {
                Text("Siret :")
                Spacer()
                Text("\(valeurSiret)")
            }.padding(.leading, 20)
                .padding(.trailing, 20)
            BlocInfos(title: "Domiciliation :", value: valeurDomiciliation)
            BlocInfos(title: "Début d'activité le", value: valeurDate)
            BlocInfos(title: "Secteur d'activité", value: valeurSecteur)
            BlocInfos(title: "Type d'activité", value: valeurType)
            BlocInfos(title: "ACCRE", value: valeurAccre)
            BlocInfos(title: "Activité Principal", value: valeurActPrincipal)
            BlocInfos(title: "Impôt libératoire", value: valeurImpot)
        }.padding(.leading, 20)
            .padding(.trailing, 20)
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
            BlocInfos(title: "Début d'activité le", value: valeurDate)
            BlocInfos(title: "Secteur d'activité", value: valeurSecteur)
            BlocInfos(title: "Type d'activité", value: valeurType)
            BlocInfos(title: "ACCRE", value: valeurAccre)
            BlocInfos(title: "Activité Principal", value: valeurActPrincipal)
            BlocInfos(title: "Impôt libératoire", value: valeurImpot)
        }.padding(.leading, 20)
            .padding(.trailing, 20)
    }
}
struct ZoomQRCodeView : View {
    @State var name : String
    @State var emailAddress : String
    var body : some View{
        Text("Ma Carte de Visite").font(.title).padding()
        Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
}
