//
//  HomeDemarcheCreaView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheCreaView: View {
    @Binding var etapeEnCours: Int
    @State var isActive : Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    HStack {
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 3, height: 470)
                        Spacer()
                    }
                    .padding(.leading, 43.0)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            
                            ForEach(etapesCreation) { etape in
                                NavigationLink(destination: DetailEtapeCreaView(etape: etape, etapeEnCours: $etapeEnCours, rootIsActive: self.$isActive)) {
                                    //Condition pour savoir quelles icônes afficher
                                    if etape.number == etapeEnCours {
                                        CercleVertPlay(text: etape.name)
                                    } else if etape.number < etapeEnCours {
                                        CercleVertFait(text: etape.name)
                                    } else {
                                        CercleGrisVide(text: etape.name)
                                    }
                                    
                                }
                            }
                            
                            //AJOUTER UN BOUTON TERMINE QUI :
                            //- VA MODIFIER @AppStorage homeScreen = "suivi"
                            //- VA REDIRIGER VERS HOME MON ENTREPRISE POUR REMPLIR
                            
                            if etapeEnCours > 8 {
                                NavigationLink(destination: HomeMonEntrepriseView().navigationBarHidden(true)) {
                                    BoutonPlein(label: "Terminé")
                                }
                                
                            }
                            
                            
                            
                        }
                        Spacer()
                    }
                    .padding(.leading, 15.0)
                }
                .navigationBarTitle(Text("Démarches création"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        NavigationLink (destination: HomeDemarcheSuiviView().navigationBarHidden(true)) {
                            //AJOUTER UNE POP-UP POUR CONFIRMATION + REDIRECTION VERS MON ENTREPRISE POUR REMPLIR LES INFOS ?
                            //HomeDemarcheSuiviView()
                            //MAJ LA VARIABLE @APPSTORAGE QUI REPRESENTE L'AVANCEMENT (crea, suivi ou cloture) POUR SAVOIR QUEL ECRAN OUVRIR EN PREMIER
                            Text("Passer")
                        }
                        .foregroundColor(Color("greenMEkit"))
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
