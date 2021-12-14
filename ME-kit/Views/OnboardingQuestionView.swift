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
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("greenMEkit"))
                    Text("Je veux créer ma micro-entreprise")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 300, height: 100)
                .cornerRadius(20.0)
                
            }.padding(.top, 250.0)
            
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(Color("greenMEkit"), lineWidth: 4.0)
                Text("J'ai déjà créé ma micro-entreprise")
                    .foregroundColor(Color("greenMEkit"))
                    .font(.title)
            }
            .frame(width: 300, height: 100)
            .cornerRadius(20.0)
            
            
//            BoutonVide(label: "J'ai déjà créé ma micro-entreprise")
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
            Spacer()
            Image("logoMEkit")
                .resizable()
                .frame(width: 200, height: 143, alignment: .center)
            
            
            
        }
    }
}

//struct OnboardingQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingQuestionView()
//    }
//}
