//
//  CercleGrisFait.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 02/12/2021.
//

import SwiftUI

struct CercleGrisFait: View {
    var text : String

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 55.0, height: 55.0)
                    .foregroundColor(.gray)
             
                Image(systemName: "checkmark.shield")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(.white)
                    
            }
            VStack (alignment: .leading){
                Text(text).font(.title3).foregroundColor(.gray)
                Text(dateFormatter.string(from: entrepriseParDefaut.dateeDebutActivite)).font(.footnote).foregroundColor(.gray)
            }
        }    }
}

struct CercleGrisFait_Previews: PreviewProvider {
    static var previews: some View {
        CercleGrisFait(text: "PREVIEW")
    }
}
