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
                    .frame(width: 55.0, height: 55.0)
                    .foregroundColor(.gray)
             
                Image(systemName: "arrow.counterclockwise")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 20.0, height: 20.0).foregroundColor(.white)
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
