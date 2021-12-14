//
//  ListViewModel.swift
//  ToPayList
//
//  Created by François-Xavier Méité on 09/12/2021.
//

import Foundation
import SwiftUI

class FeesListViewModel: ObservableObject {
    
    
    @Published var items: [FeesModel] = [] {
        didSet {
            save()
        }
    }
    let itemKey = "Champs"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([FeesModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func getValue() -> String {
        let sumo = self.items.map{ Double($0.value)! }.reduce(0,+)
        let suma = String(format: "%.2f", sumo)
        return suma
    }
    
    func getValueInt() -> Double {
        let sumInt = self.items.map{ Double($0.value)! }.reduce(0,+)
        return sumInt
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, value: String, total: Double) {
        let newItem = FeesModel(title: title, value: value, total: total)
        items.append(newItem)
        // total = total + Int(value)! ?? 0
    }
    
    func save() {
        if let  encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
