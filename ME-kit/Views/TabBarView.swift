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
    //variable qui désigne le TabBarItem actif
    @State private var currentTab: Tab = .demarche
    
    var body: some View {
        
        VStack {
            TabView(selection: $currentTab) {
                
                if (homeScreen == "creation") {
                    HomeDemarcheCreaView(homeScreen: $homeScreen, currentTab: $currentTab, etapeEnCours: $etapeEnCours)
                        .tabItem {
                            Image(systemName: "doc.text")
                            Text("Démarches")
                        }
                        .tag(Tab.demarche)
                }
                else {
                    HomeDemarcheSuiviView()
                        .tabItem {
                            Image(systemName: "doc.text")
                            Text("Démarches")
                        }
                        .tag(Tab.demarche)
                }
                
                HomeMonEntrepriseView()
                    .tabItem {
                        Image(systemName: "suitcase")
                        Text("Mon entreprise")
                    }
                    .tag(Tab.monEntreprise)
                
                HomeRevenuNetView()
                    .tabItem {
                        Image(systemName: "wrench.and.screwdriver.fill")
                        Text("Revenu net")
                    }
                    .tag(Tab.revenuNet)
            }
            .accentColor(Color("greenMEkit"))
            .edgesIgnoringSafeArea(.bottom)
            
            //Bouton pour faire réapparaitre l'onboarding
            Button { showOnboarding.toggle() } label: {
                Rectangle()
                    .frame(height: 3.0)
                    .foregroundColor(.red)
            }
            
        }.fullScreenCover(isPresented: $showOnboarding, content: { OnboardingQuestionView(currentTab: $currentTab, showOnboarding: $showOnboarding, homeScreen: $homeScreen, etapeEnCours: $etapeEnCours)})
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

