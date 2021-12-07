//
//  OnboardingQuestionView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @Binding var showOnboarding: Bool
    @Binding var homeScreen: String
    @Binding var etapeEnCours: Int
    
    var body: some View {
        VStack {
            Button {
                etapeEnCours = 1
//                homeScreen = "creation"
                showOnboarding.toggle()
            } label: {
                BoutonPlein(label: "Je veux créer ma micro-entreprise")
            }
            
            Button {
                //ICI FAIRE LES MÊMES ACTIONS QU'AVEC LE BOUTON TERMINE DE FIN DE DEMARCHE CREA "HomeDemarcheCrea
                etapeEnCours = 8
//                homeScreen = "suivi"
                showOnboarding.toggle()
            } label: {
                BoutonVide(label: "J'ai déjà créé ma micro-entreprise")
            }
            
        }
    }
}

//struct OnboardingQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingQuestionView()
//    }
//}
