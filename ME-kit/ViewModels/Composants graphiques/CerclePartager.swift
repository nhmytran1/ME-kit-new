//
//  CerclePartager.swift
//  ME-kit
//
//  Created by Apprenant 82 on 06/12/2021.
//

import SwiftUI

struct CerclePartager: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(Color("greenMEkit"))
             
                Image(systemName: "square.and.arrow.up.on.square")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 25.0, height: 25.0).foregroundColor(.white)
            }
        }    }
}

struct CerclePartager_Previews: PreviewProvider {
    static var previews: some View {
        CerclePartager()
    }
}
