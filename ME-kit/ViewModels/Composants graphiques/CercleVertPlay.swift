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
                    .frame(width: 55.0, height: 55.0)
                    .foregroundColor(Color("greenMEkit"))
                
                Image(systemName: "play")
                    .resizable()
                    .padding(.leading, 3.0)
                    .frame(width: 20.0, height: 20.0).foregroundColor(.white)
            }
            Text(text).font(.title3).foregroundColor(Color("greenMEkit"))
        }
    }
}

struct CercleVertPlay_Previews: PreviewProvider {
    static var previews: some View {
        CercleVertPlay(text: "PREVIEW")
    }
}
