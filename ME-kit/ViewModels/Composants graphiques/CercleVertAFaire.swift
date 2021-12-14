//
//  CercleVertAFaire.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 99 on 01/12/2021.
//

import SwiftUI



struct CercleVertAFaire: View {
    var text : String
    var echeance : String
    
    var body: some View {      
        HStack {
            ZStack {
                Circle()
                    .frame(width: 55.0, height: 55.0)
                    .foregroundColor(Color("greenMEkit"))
               
                Image(systemName: "arrow.counterclockwise")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 20.0, height: 20.0).foregroundColor(.white)
            }
            VStack(alignment: .leading) {
                Text(text).font(.title3).foregroundColor(Color("greenMEkit"))
                Text("Prochaine déclaration : \(echeance)").font(.footnote).foregroundColor(.gray)
            }
        }
    }
}

struct CercleVertAFaire_Previews: PreviewProvider {
    static var previews: some View {
        CercleVertAFaire(text: "PREVIEW", echeance: "Tous les trimestres")
    }
}
