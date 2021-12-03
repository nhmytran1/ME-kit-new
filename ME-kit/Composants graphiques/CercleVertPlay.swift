//
//  CercleVertPlay.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 99 on 01/12/2021.
//

import SwiftUI

struct CercleVertPlay: View {
    var text : String
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(Color("greenMEkit"))
                
                Image(systemName: "play")
                    .resizable()
                    .padding(.leading, 3.0)
                    .frame(width: 25.0, height: 22.0).foregroundColor(.white)
            }
            Text(text).font(.title2).foregroundColor(Color("greenMEkit"))
        }
    }
}

struct CercleVertPlay_Previews: PreviewProvider {
    static var previews: some View {
        CercleVertPlay(text: "PREVIEW")
    }
}
