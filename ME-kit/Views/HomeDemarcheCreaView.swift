//
//  HomeDemarcheCreaView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheCreaView: View {
    @Binding var homeScreen: String
    @Binding var currentTab: Tab
    @Binding var etapeEnCours: Int
    @State var isActive : Bool = false
    @State private var showingAlert = false
    //variable globale pour pouvoir déballer la variable etape en dehors de la boucle ForEach (contournement du bug SwiftUI lié au NavLink DANS une boucle ForEach)
    @State var etapeTmp: EtapeDemarche?
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    //BARRE GRISE QUI REPRESENTE LE FIL DES ETAPES
                    HStack {
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 3, height: 470)
                        Spacer()
                    }
                    .padding(.leading, 43.0)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Spacer()
                            //Boucle d'affichage des boutons avec conditions en fonction de etapeEnCours
                            ForEach(etapesCreation) { etape in
                                if etape.number == etapeEnCours {
                                    CercleVertPlay(text: etape.name)
                                    //nécessaire pour emballer l'etape dans la vairable globale etapeTmp
                                        .onTapGesture {
                                            etapeTmp = etape
                                            isActive = true
                                        }
                                } else if etape.number < etapeEnCours {
                                    CercleVertFait(text: etape.name)
                                    //nécessaire pour emballer l'etape dans la vairable globale etapeTmp
                                        .onTapGesture {
                                            etapeTmp = etape
                                            isActive = true
                                        }
                                } else {
                                    CercleGrisVide(text: etape.name)
                                    //nécessaire pour emballer l'etape dans la vairable globale etapeTmp
                                        .onTapGesture {
                                            etapeTmp = etape
                                            isActive = true
                                        }
                                }
                            }
                            
                            //déballage de la variable globale pour la NavigationLink
                            if let unwrappedEtape = etapeTmp {
                                NavigationLink(destination: DetailEtapeCreaView(etape: unwrappedEtape, etapeEnCours: $etapeEnCours, shouldPopToRootView: self.$isActive),
                                               isActive: $isActive) {EmptyView()}
                            }
                            
                            
                            //BOUTON TERMINE QUI :
                            //- MODIFIE @AppStorage homeScreen = "suivi"
                            //- REDIRIGE VERS HOME MON ENTREPRISE POUR REMPLIR LES INFOS
                            //- AFFICHE UNE POP-UP DE CONFIRMATION
                            
                            HStack {
                                Spacer()
                                if etapeEnCours > 8 {
                                    BoutonPlein(label: "Terminé")
                                        .onTapGesture {
                                            showingAlert = true
                                        }
                                        .alert("Félicitations !\r Vous avez créé votre entreprise, veuillez remplir vos informations pour pouvoir continuer.", isPresented: $showingAlert) {
                                            Button("Aller à Mon Entreprise", role: .none) {
                                                homeScreen = "suivi"
                                                currentTab = Tab.monEntreprise
                                            }
                                            Button("Annuler", role: .cancel) { }
                                        }
                                    
                                }
                                Spacer()
                            }
                            .padding(10.0)
                        }
                        Spacer()
                    }
                    .padding(.leading, 16.5)
                }
                .navigationBarTitle(Text("Démarches création"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    //Bouton pour la démo - raccourci pour aller à la fin du workflow
                    ToolbarItem (placement: .cancellationAction) {
                        Button(action: { etapeEnCours = 8 } , label: { Text("Racc. démo").foregroundColor(.white)} )
                    }
                    
                    ToolbarItem {
                        
                        Button(action: {
                            showingAlert = true
                        }, label: {
                            Text("Passer")
                        })
                        .alert("Confirmez-vous votre action ? \r Veuillez remplir vos informations pour pouvoir continuer.", isPresented: $showingAlert) {
                                Button("Aller à Mon Entreprise", role: .none) {
                                    homeScreen = "suivi"
                                    currentTab = Tab.monEntreprise
                                }
                                Button("Annuler", role: .cancel) { }
                            }
                    }
                }
            }
        }
    }
}

//struct HomeDemarcheCreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeDemarcheCreaView()
//    }
//}
