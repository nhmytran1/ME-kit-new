//
//  TabBarView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            //AJOUTER UNE CONDITION EN FONCTION DE ENTREPRISE.AVANCEMENT!!
            HomeDemarcheCreaView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Démarches")
                }
            HomeMonEntrepriseView()
                .tabItem {
                    Image(systemName: "suitcase")
                    Text("Mon entreprise")
                }
            HomeRevenuNetView()
                .tabItem {
                    Image(systemName: "wrench.and.screwdriver.fill")
                    Text("Revenu net")
                    
                }
        }.accentColor(Color("greenMEkit"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

