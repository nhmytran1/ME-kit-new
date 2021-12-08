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
    //variable globale pour pouvoir déballer la variable etape en dehors de la boucle ForEach (contournement du bug SwiftUI lié au NavLink DANS une boucle ForEach)
    @State var etapeTmp: EtapeDemarche?
    
    
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
                            
                            
                            //AJOUTER UN BOUTON TERMINE QUI :
                            //- VA MODIFIER @AppStorage homeScreen = "suivi"
                            //- VA REDIRIGER VERS HOME MON ENTREPRISE POUR REMPLIR
                            
                            HStack {
                                Spacer()
                                if etapeEnCours > 8 {
                                    NavigationLink(destination: HomeMonEntrepriseView().navigationBarHidden(true)) {
                                        BoutonPlein(label: "Terminé")
                                    }
                                    Spacer()
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
