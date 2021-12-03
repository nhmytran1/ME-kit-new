//
//  Alertes.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 30/11/2021.
//

import Foundation

struct Alerte: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: String
}

//source de données
var alertes: [Alerte] = [
    Alerte(title: "Alerte 1", content: "Vous devez faire Action 1", date: "29/11/2021"),
    Alerte(title: "Alerte 2", content: "Vous devez faire Action 2", date: "30/11/2021"),
    Alerte(title: "Alerte 3", content: "Vous devez faire Action 3", date: "01/12/2021"),
    Alerte(title: "Alerte 4", content: "Vous devez faire Action 4", date: "02/12/2021"),
    Alerte(title: "Alerte 5", content: "Vous devez faire Action 5", date: "03/12/2021")

]
