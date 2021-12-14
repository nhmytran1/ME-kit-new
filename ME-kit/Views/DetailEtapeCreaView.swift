//
//  DetailEtapeCreaView.swift
//  ME-kit
//
//  Created by Apprenant 99 on 06/12/2021.
//

import SwiftUI

struct DetailEtapeCreaView: View {
    
    var etape: EtapeDemarche
    @Binding var etapeEnCours: Int
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
                    }.padding(.vertical, 10)
                                                    
                    
                    //Condition pour savoir quelles icônes afficher
                    if etape.number == etapeEnCours {
                        Button { //ACTION(S)
                            etapeEnCours += 1
                            self.shouldPopToRootView = false
                        } label: {
                            BoutonPlein(label: "Terminé")
                        }
                        
                    } else if etape.number < etapeEnCours {
                        Text("Etape validée !")
                            .foregroundColor(Color("greenMEkit"))
                            .bold()
                            .padding()
                    } else {
                        BoutonVide(label: "Terminé")
                    }
                    
                    
                    
                    
                }.padding(.horizontal, 10)
                
                
            }
//        }
        .navigationBarTitle(Text(etape.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailEtapeCreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEtapeCreaView(etape: <#T##EtapeDemarche#>, etapeEnCours: <#T##Binding<Int>#>)
//    }
//}
