//
//  DetailEtapeClotureView.swift
//  ME-kit
//
//  Created by Apprenant 67 on 14/12/2021.
//

import SwiftUI

struct DetailEtapeClotureView: View {
    @Binding var showOnboarding: Bool
    var etape: EtapeDemarche
    
    var body: some View {
        ScrollView {
            VStack {
                //BLOC DESCRIPTION
                ZStack {
                    RoundedRectangle(cornerRadius: 30.0)
                        .stroke(Color("greenMEkit"), lineWidth: 4.0)
                    Text(.init(etape.description))
                        .padding()
                }.padding()
                
                //LISTE DES DOCUMENTS NECESSAIRES
                Spacer()
                
                //BOUTON LIEN EXTERNE
                Spacer()
                BoutonExternalLink(label: "Site de \(etape.name)", url: etape.url)
                
                //BOUTON TERMINE
                Button { //ACTION(S)
                    showOnboarding.toggle()
                } label: {
                    BoutonPlein(label: "Terminé")
                }
            }
        }
    }
}

//struct DetailEtapeClotureView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEtapeClotureView(etape: etape13)
//    }
//}
