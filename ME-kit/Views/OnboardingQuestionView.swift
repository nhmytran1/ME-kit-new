//
//  OnboardingQuestionView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @Binding var currentTab: Tab
    @Binding var showOnboarding: Bool
    @Binding var homeScreen: String
    @Binding var etapeEnCours: Int
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button {
                etapeEnCours = 1
                homeScreen = "creation"
                showOnboarding.toggle()
            } label: {
                BoutonPlein(label: "Je veux créer ma micro-entreprise")
            }
            
            
            
            BoutonVide(label: "J'ai déjà créé ma micro-entreprise")
                .onTapGesture {
                    showingAlert = true
                }
                .alert("Vous avez déjà créé votre entreprise. \r Veuillez remplir vos informations pour pouvoir continuer.", isPresented: $showingAlert) {
                    Button("Aller à Mon Entreprise", role: .none) {
                        currentTab = Tab.monEntreprise
                        showOnboarding.toggle()
                    }
                    Button("Annuler", role: .cancel) { }
                }

            
            
            
        }
    }
}

//struct OnboardingQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingQuestionView()
//    }
//}
