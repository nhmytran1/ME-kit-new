//
//  CercleGrisVide.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 99 on 01/12/2021.
//

import SwiftUI

struct CercleGrisVide: View {
    var text : String
    var body: some View {
        HStack {
            Circle()
                .frame(width: 55.0, height: 55.0)
                .foregroundColor(.gray)
            Text(text).font(.title3).foregroundColor(.gray)
        }
    }
}

struct CercleGrisVide_Previews: PreviewProvider {
    static var previews: some View {
        CercleGrisVide(text: "PREVIEW")
    }
}
