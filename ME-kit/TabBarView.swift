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
    
    var body: some View {
        
        VStack {
            //Text(homeScreen)
            TabView {
                if (homeScreen == "creation") {
                    HomeDemarcheCreaView()
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
            
        }.fullScreenCover(isPresented: $showOnboarding, content: { OnboardingQuestionView(showOnboarding: $showOnboarding, homeScreen: $homeScreen)})
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

