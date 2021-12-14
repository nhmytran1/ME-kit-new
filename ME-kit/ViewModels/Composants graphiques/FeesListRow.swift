//
//  ListRowView.swift
//  ToPayList
//
//  Created by François-Xavier Méité on 08/12/2021.
//

import SwiftUI

struct FeesListRow: View {
    
    let item: FeesModel
    let value: FeesModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
            Text("\(item.value)")
        }
    }
}

struct FeesListRow_Previews: PreviewProvider {
    
    static var item0 = FeesModel(title: "First Try", value: "10", total: 0)
    
    static var previews: some View {
        FeesListRow(item: item0, value: item0)
    }
}
