//
//  DetailDocumentView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 06/12/2021.
//

import SwiftUI

struct DetailDocumentView: View {
    var element : Doc
    @State private var showingSheet = false
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20).frame(width: 350, height: 500).foregroundColor(.gray)
                ZStack{
//                    Circle().frame(width: 80, height: 80).foregroundColor(Color("greenMEkit"))
                    Button(action: {
                        self.showingSheet = true
                    }) {
                        CerclePartager()
//                        Text("Partager").foregroundColor(.white)
                    }
                    .sheet(isPresented: $showingSheet,
                           content: {
                        ActivityView(activityItems: [NSURL(string: "https://KBIS.pdf")!] as [Any], applicationActivities: nil) })
                }.position(x: 300, y: 450)
            }
            Button {
                
            } label: {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 50).frame(width: 190, height: 80).foregroundColor(Color("greenMEkit"))
//                    Text("Télécharger").foregroundColor(.white)
//                }
                BoutonPlein(label: "Télécharger")
            }
        }.navigationTitle(element.texte)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Text("Mon entreprise")
//                }
//            }
    }
}

struct DetailDocumentView_Previews: PreviewProvider {
    static var previews: some View {
//       DetailDocumentView(element: Doc(texte: "KBIS.pdf"))
        CardView(element: Doc(texte: "ok", dateDoc: Date.now))
    }
}


struct CardView: View {
    var element : Doc
    var body: some View {
        VStack (alignment: .leading){
            Image(systemName: "doc")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.5)
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
            HStack {
                VStack(alignment: .leading) {
                    Text("00/00/00")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(element.texte)
                        .font(.title).foregroundColor(Color("greenMEkit"))
                    Text("by \(entrepriseParDefaut.nomination)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
            }
        }.padding()
        .frame(width: 180, height: 150, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .foregroundColor(.black)
            
        )
        .padding()
    }
}
