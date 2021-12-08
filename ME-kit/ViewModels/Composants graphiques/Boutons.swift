//
//  Boutons.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 01/12/2021.
//

import SwiftUI

struct BoutonPlein: View {
    var label: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("greenMEkit"))
            Text(label)
                .foregroundColor(.white)
        }
        .frame(width: 240, height: 60)
        .cornerRadius(30.0)
    }
}


struct BoutonVide: View {
    var label: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30.0)
                .stroke(Color("greenMEkit"), lineWidth: 4.0)
            Text(label)
                .foregroundColor(Color("greenMEkit"))
        }
        .frame(width: 240, height: 60)
        .cornerRadius(30.0)
    }
}


struct Boutons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BoutonPlein(label: "PREVIEW")
            BoutonVide(label: "PREVIEW")
        }
    }
}
