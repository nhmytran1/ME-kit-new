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
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(.gray)
             
                Image(systemName: "checkmark.shield")
                    .resizable()
                    .padding(0.0)
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                    
            }
            Text(text).font(.title2).foregroundColor(.gray)
        }    }
}

struct CercleGrisFait_Previews: PreviewProvider {
    static var previews: some View {
        CercleGrisFait(text: "PREVIEW")
    }
}
