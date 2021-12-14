//
//  DetailEtapeView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct DetailEtapeView: View {
    var etape: EtapeDemarche
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        //NavView à supprimer
//        NavigationView {
            ScrollView {
                VStack {
                    //BLOC DESCRIPTION
                    ZStack {
                        RoundedRectangle(cornerRadius: 30.0)
                            .stroke(Color("greenMEkit"), lineWidth: 4.0)
                        Text(etape.description)
                            .padding()
                    }.padding()
                    
                    //LISTE DES DOCUMENTS NECESSAIRES
                    Spacer()
                    Text("Documents nécessaires")
                        .font(.headline)
                        .padding()
                    VStack (alignment: .leading) {
                        ForEach(etape.documents, id: \.id) { d in
                            Text("- \(d.docname)")
                        }
                    }
                    
                    //BOUTON LIEN EXTERNE
                    Spacer()
                    BoutonExternalLink(label: "Site de \(etape.name)", url: etape.url)
                    
                    //BOUTON TERMINE
                    Button { //ACTION(S)
                        self.shouldPopToRootView = false
                    } label: {
                        BoutonPlein(label: "Terminé")
                    }
                }
            }
//        }
        .navigationBarTitle(Text(etape.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}


//struct DetailEtapeView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEtapeView(etape: etape9, shouldPopToRootView: <#T##Binding<Bool>#>)
//    }
//}
