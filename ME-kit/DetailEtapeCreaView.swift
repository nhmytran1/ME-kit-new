//
//  DetailEtapeCreaView.swift
//  ME-kit
//
//  Created by Apprenant 99 on 06/12/2021.
//

import SwiftUI

struct DetailEtapeCreaView: View {
    
    @State var isDone:Bool = false
    func toggle(){isDone = !isDone}
    
    var etape: EtapeDemarche
    var body: some View {
        NavigationView {
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
                    Text("A noter:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.trailing)
                        .padding()
                        .foregroundColor(Color("greenMEkit"))
                        
                    VStack (alignment: .leading) {
                        Text(.init(etape.info)).padding(.horizontal, 40)
                    }
                    
                    //BOUTON LIEN EXTERNE
  //                  Spacer()
   //                 BoutonExternalLink(label: "Site de \(etape.name)", url: etape.url)
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    //BOUTON TERMINE
                    Button { //ACTION(S)

                        
                        
                        print("étape validée")
                    } label: {
                        BoutonPlein(label: "Terminé")
                    }
                }.padding(.horizontal, 10)
                               
                               
                               
            }
        }
        .navigationBarTitle(Text(etape.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailEtapeCreaView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEtapeCreaView(etape: etapesSuivi[0])
    }
}
