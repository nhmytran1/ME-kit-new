//
//  ResumeInfo.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 01/12/2021.
//

import SwiftUI

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
struct StructureMonEntreprise: View{
    @State var newImage : UIImage?
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .foregroundColor(Color("greenMEkit"))
                .frame(width: 350, height: 450)
            
            
            VStack(spacing: 5) {
                VStack {
                    BlocInfos(title: "Nomination :", value: blocInfosMonEntreprise.nomination)
                    HStack{
                        if newImage == nil {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            Image(uiImage: newImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(20)
                                .padding()
                        }
                    }
                    BlocInfos(title: "Type d'activité :", value: blocInfosMonEntreprise.donneeTypeActivite)
                    BlocInfos(title: "Domiciliation :", value: blocInfosMonEntreprise.donneeDomiciliation)
                    BlocInfos(title: "Début d'activité :", value: blocInfosMonEntreprise.donneeDebutActivite)
                    BlocInfos(title: "Type d'activité :", value: blocInfosMonEntreprise.donneeTypeActivite)
                    BlocInfos(title: "Domiciliation :", value: blocInfosMonEntreprise.donneeDomiciliation)
                    BlocInfos(title: "ACCRE :", value: blocInfosMonEntreprise.donneeACCRE.rawValue)
                    BlocInfos(title: "Activité principale :", value: blocInfosMonEntreprise.donneeActivitePrincipal.rawValue)
                    BlocInfos(title: "Impôt libératoire :", value: blocInfosMonEntreprise.donneeImpot.rawValue)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
    }
}
struct StructureRevenu: View{
    @State var newImage : UIImage?
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .foregroundColor(Color("greenMEkit"))
                .frame(width: 350, height: 240)
            
            
            VStack(spacing: 5) {
                
                Text("Résumé d'information")
                    .underline()
                    .padding()
                
                VStack {
                    BlocInfos(title: "Type d'activité :", value: blocInfosMonEntreprise.donneeTypeActivite)
                    BlocInfos(title: "Domiciliation :", value: blocInfosMonEntreprise.donneeDomiciliation)
                    BlocInfos(title: "Début d'activité :", value: blocInfosMonEntreprise.donneeDebutActivite)
                    BlocInfos(title: "Type d'activité :", value: blocInfosMonEntreprise.donneeTypeActivite)
                    BlocInfos(title: "Domiciliation :", value: blocInfosMonEntreprise.donneeDomiciliation)
                    BlocInfos(title: "ACCRE :", value: blocInfosMonEntreprise.donneeACCRE.rawValue)
                    BlocInfos(title: "Activité principale :", value: blocInfosMonEntreprise.donneeActivitePrincipal.rawValue)
                    BlocInfos(title: "Impôt libératoire :", value: blocInfosMonEntreprise.donneeImpot.rawValue)
                }.padding(.leading, 20)
                    .padding(.trailing, 20)
            }
        }
    }
}
struct StructureBlocInfosMonEntreprise : View{
    @State var donneeEntreprise = blocInfosMonEntreprise
    @State var newImage : UIImage?
    @State var donnee : Bool
    var body: some View {
        VStack {
            if donnee == true {
                StructureMonEntreprise()
            } else {
                StructureRevenu()
            }
        }
    }
}
struct StructureBlocInfosMonEntreprise_Previews: PreviewProvider {
    static var previews: some View {
        StructureBlocInfosMonEntreprise(donnee: false)
    }
}
