//
//  HomeDemarcheCreaView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheCreaView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 3, height: 400)
                    Spacer()
                }
                .padding(.leading, 43.0)
                
                HStack {
                    VStack (alignment: .leading) {
                        ForEach(etapesCreation) { etape in
                            NavigationLink(destination: DetailEtapeView(etape: etape)) {
                                CercleVertPlay(text: etape.name)
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
                    NavigationLink {
                        //AJOUTER UNE POP-UP POUR CONFIRMATION + REDIRECTION VERS MON ENTREPRISE POUR REMPLIR LES INFOS ?
                        HomeDemarcheSuiviView()
                    } label: {
                        Text("Passer")
                    }
                    .foregroundColor(Color("greenMEkit"))
                }
            }
        }
    }
}

struct HomeDemarcheCreaView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDemarcheCreaView()
    }
}
