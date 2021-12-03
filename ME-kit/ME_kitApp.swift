//
//  ME_kitApp.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

@main
struct ME_kitApp: App {
    //ONBOARDING AVEC CONDITIONS ETC
    // si Entreprise.avancement = creation alors HomeDemarcheCreationView
    // si Entreprise.avancement = suivi alors HomeDemarcheView
    // si Entreprise.avancement = cloture alors HomeDemarcheClotureView
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}

