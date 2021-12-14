//
//  AjoutView.swift
//  ToPayList
//
//  Created by François-Xavier Méité on 08/12/2021.
//

import SwiftUI
import Combine

struct AddFees: View {
    
    //    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: FeesListViewModel
    
    @State var text: String = ""
    @State var value: String = ""
    @State var total: Double = 0
    @State var alertName: String = ""
    @State var isAlertShowing: Bool = false
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        VStack {
            Section {
                
                TextField("Ajouter une nouvelle charge fixe", text: $text)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(10)
                TextField("Saissisez une valeur", text: $value)
                    .keyboardType(.decimalPad)
                    .focused($nameIsFocused)
                    .onReceive(Just(value)) { i in
                        let filtered = i.filter { "0123456789.".contains($0) }
                        if filtered != i {
                            self.value = filtered
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(10)
            }
        }
        .alert(isPresented: $isAlertShowing) {
            Alert(title: Text("Attention !"), message: Text("Le nom doit avoir au moins 2 caractères"), dismissButton: .default(Text("Ok")))
        }
        Button {
            
            ajoutButtonPress()
            text = ""
            value = ""
            nameIsFocused = false
            
        } label: {
            Text("Ajouter")
        }
    }
    
    func ajoutButtonPress() {
        if MinimumLetters() {
            listViewModel.addItem(title: text, value: value, total: total)
            //presentationMode.wrappedValue.dismiss()
        }
    }
    func MinimumLetters() -> Bool {
        if text.count < 2 {
            isAlertShowing.toggle()
            return false
        }
        return true
    }
}

struct AddFees_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddFees()
        }
        .environmentObject(FeesListViewModel())
    }
}
