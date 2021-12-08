//
//  HomeRevenuNetView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeRevenuNetView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("Ecran d'accueil simulateur Revenu Net (Fx)")
            }
            .navigationBarTitle(Text("Revenu net"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeRevenuNetView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRevenuNetView()
    }
}
