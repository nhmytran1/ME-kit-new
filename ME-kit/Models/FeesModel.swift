//
//  ItemModel.swift
//  ToPayList
//
//  Created by François-Xavier Méité on 08/12/2021.
//

import Foundation

struct FeesModel: Identifiable, Codable {
    
    let id: String
    let title: String
    let value: String
    let total: Double
    
    init(id: String = UUID().uuidString, title: String, value: String, total: Double) {
        self.id = id
        self.title = title
        self.value = value
        self.total = total
    }
}
