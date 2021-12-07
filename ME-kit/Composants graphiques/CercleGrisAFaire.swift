//
//  CercleGrisAFaire.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 99 on 01/12/2021.
//

import SwiftUI

struct CercleGrisAFaire: View {
    var text: String
    
    var body: some View {
        
        HStack {
            ZStack {
                Circle()
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(.gray)
             
                Image(systemName: "arrow.counterclockwise")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 25.0, height: 25.0).foregroundColor(.white)
            }
            Text(text).font(.title3).foregroundColor(.gray)
        }
    }
}

struct CercleGrisAFaire_Previews: PreviewProvider {
    static var previews: some View {
        CercleGrisAFaire(text: "PREVIEW")
    }
}
