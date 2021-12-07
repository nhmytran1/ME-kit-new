//
//  TabBarView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct TabBarView: View {
    
    @AppStorage("showOnboarding") private var showOnboarding: Bool = true
    @AppStorage("homeScreen") private var homeScreen: String = ""
    @AppStorage("etapeEnCours") private var etapeEnCours: Int = 1

    
    var body: some View {
        
        VStack {
            TabView {
                if (homeScreen == "creation") {
                    HomeDemarcheCreaView(etapeEnCours: $etapeEnCours)
                        .tabItem {
                            Image(systemName: "doc.text")
                            Text("Démarches")
                        }
                }
                else {
                    HomeDemarcheSuiviView()
                        .tabItem {
                            Image(systemName: "doc.text")
                            Text("Démarches")
                        }
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
            //Bouton pour faire réapparaitre l'onboarding
            Button { showOnboarding.toggle() } label: {
                Rectangle()
                    .frame(height: 3.0)
                    .foregroundColor(.red)
            }
            
        }.fullScreenCover(isPresented: $showOnboarding, content: { OnboardingQuestionView(showOnboarding: $showOnboarding, homeScreen: $homeScreen, etapeEnCours: $etapeEnCours)})
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

