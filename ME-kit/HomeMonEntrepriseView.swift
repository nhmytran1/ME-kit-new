//
//  HomeMonEntrepriseView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeMonEntrepriseView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("Ecran d'accueil Mon entreprise (Cynthia)")
            }
            .navigationBarTitle(Text("Mon entreprise"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeMonEntrepriseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMonEntrepriseView()
    }
}

