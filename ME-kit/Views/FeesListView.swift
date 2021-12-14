//
//  ListView.swift
//  ToPayList
//
//  Created by François-Xavier Méité on 08/12/2021.
//

import SwiftUI

struct FeesListView: View {
    
    @EnvironmentObject var listViewModel: FeesListViewModel
    
    var body: some View {
        if listViewModel.items.isEmpty {
            VStack(spacing: 40) {
                Text("Pas de frais")
                    .font(.title)
                    .fontWeight(.bold)
                    .italic()
                Text("Augmentez votre productivité, rassemblez vos frais et obtenez votre total !")
                    .padding()
                Spacer()
                AddFees()
                Spacer()
            }
            .multilineTextAlignment(.center)
        } else {
            VStack {
                List {
                    ForEach(listViewModel.items) { item in
                        FeesListRow(item: item, value: item)
                        
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                    Text("Total des charges : \(listViewModel.getValue())€")
                    //Ajout()
                }
                .listStyle(.plain)
                .navigationTitle("Vos charges")
                .toolbar {
                    EditButton()
                }
                
                AddFees()
                    .padding()
            }
        }
        
    }
}

struct FeesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeesListView()
        }
        .environmentObject(FeesListViewModel())
    }
}
