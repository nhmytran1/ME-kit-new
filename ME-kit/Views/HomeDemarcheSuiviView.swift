//
//  HomeDemarcheSuiviView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheSuiviView: View {
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                //BARRE DE SUIVI LATERALE
                HStack {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 3, height: 480)
                    Spacer()
                }
                .padding(.leading, 43.0)
                
                HStack {
                    VStack (alignment: .leading) {
                        CercleGrisFait(text: "Création")
                        
                        titreTypeEtape(label: "MES DEMARCHES RECURRENTES")
                            .padding(.leading, 50.0)
                        
                        VStack (alignment: .leading) {
                            NavigationLink(destination: DetailEtapeView(etape: etape9, shouldPopToRootView: self.$isActive),
                                           isActive: $isActive) {
                                CercleVertAFaire(text: etape9.name, echeance: etape9.echeance)
                                    .onTapGesture {
                                        isActive = true
                                    }
                            }
                            NavigationLink(destination: DetailEtapeView(etape: etape10, shouldPopToRootView: self.$isActive),
                                           isActive: $isActive) {
                                CercleVertAFaire(text: etape10.name, echeance: etape10.echeance)
                                    .onTapGesture {
                                        isActive = true
                                    }
                            }
                            
                        }
                        
                        //afficher le bon chiffre dans le titre
                        titreTypeEtape(label: "CA > 34 400€")
                            .padding(.leading, 50.0)
                        
                        //ajouter condition si CA > XX afficher ce bloc en vert
                        NavigationLink(destination: DetailEtapeView(etape: etapeTVA11, shouldPopToRootView: self.$isActive),
                                       isActive: $isActive) {
                            CercleGrisAFaire(text: etapeTVA11.name)
                                .onTapGesture {
                                    isActive = true
                                }
                        }
                        
                        //CLÔTURER MON ENTREPRISE
                        titreTypeEtape(label: "CA > 72 600€ OU CA = 0€")
                            .padding(.leading, 50.0)
                        
                        //ajouter condition si CA > XX afficher ce bloc
                        NavigationLink(destination: DetailEtapeView(etape: etapeCloture12, shouldPopToRootView: self.$isActive),
                                       isActive: $isActive) {
                            CercleGrisVide(text: etapeCloture12.name)
                                .onTapGesture {
                                    isActive = true
                                }
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 15.0)
            }
            .navigationBarTitle(Text("Démarches"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink (destination: MesNotificationsView()) {
                        Image(systemName: "bell")
                    }.foregroundColor(Color("greenMEkit"))
                }
            }
        }
    }
}


struct titreTypeEtape: View {
    let label: String
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .stroke(.gray, lineWidth: 2.0)
                .frame(width: 280.0, height: 30.0, alignment: .center)
            Text(label)
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
        }
        
        
    }
}


struct HomeDemarcheSuiviView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDemarcheSuiviView()
    }
}
