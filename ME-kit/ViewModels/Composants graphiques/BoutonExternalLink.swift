//
//  BoutonExternalLink.swift
//  ME-kit (iOS)
//
//  Created by Apprenant 82 on 02/12/2021.
//

import SwiftUI


struct BoutonExternalLink: View {
    let label: String
    let url: String
    var body: some View {
        Link(destination: URL(string: url)!) {
            BoutonVide(label: label)
                .padding()
        }
    }
}

struct BoutonExternalLink_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BoutonExternalLink(label: "PREVIEW", url: "https://www.google.com")
        }
    }
}
