//
//  GraphiqueCA.swift
//  ME-kit
//
//  Created by Apprenant 67 on 12/12/2021.
//

import SwiftUI



//struct GraphiqueCA_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGSecondView(max: 34400, maxSecond: 34400)
//    }
//}

struct LineGraph: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}
//struct LineGView: View {
//    @FocusState private var clavier : Bool
//    @State var max : CGFloat
//    @State var message : String = ""
//    @State var prevent = false
//    @State var on = false
//    @State var ajout : CGFloat = CGFloat()
//    @State var caAnnee: [CGFloat] = [
//        CGFloat(0),
//        CGFloat(0.3),
//        CGFloat(0.8)
//    ]
//    let Mois: String = "Année :"
//    var body: some View {
//        ScrollView {
//            VStack {
//                HStack{
//                    Section {
//                        TextField("Votre Chiffre d'Affaire ?", value: $ajout, format: .currency(code: ""))
//                            .keyboardType(.decimalPad)
//                            .padding()
//                        if prevent == true {
//                            Text(message)
//                        } else {
//                            Text("\(Int(ajout))")
//                        }
//                    }
//                    Button(action : {
//                        clavier.toggle()
//                        if ajout == CGFloat() {
//                            prevent = true
//                            message = "Erreur"
//                        } else if ajout/max > 1.0 {
//                            prevent = true
//                            message = "Vous dépassez le seuil maximum"
//                            caAnnee.append(CGFloat(1.0))
//                        } else {
//                            prevent = false
//                            caAnnee.append(CGFloat(ajout/max))
//                        }
//                    }) {
//                        Image(systemName: "keyboard.chevron.compact.down")
//                    }
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                }
//                Button("Animate") {
//                    withAnimation(.easeInOut(duration: 2)) {
//                        self.on.toggle()
//                    }
//                }
//                HStack{
//                    Text(Mois.capitalized)
//                    Text(Date.now, format: .dateTime.year())
//                }
//                LineGraph(dataPoints: caAnnee)
//                    .trim(to: on ? 1 : 0)
//                    .stroke(Color.green, lineWidth: 5)
//                    .aspectRatio(16/9, contentMode: .fit)
//                    .border(Color.gray, width: 1)
//                    .padding()
//            }
//        }
//    }
//}
//struct LineGSecondView: View {
//    @FocusState private var clavier : Bool
//    @State var ajout : CGFloat = CGFloat()
//    @State var max : CGFloat
//    @State var maxSecond : CGFloat
//    @State var message : String = ""
//    @State var prevent = false
//    @State var on = false
//    @State var ajouter : CGFloat = CGFloat()
//    @State var caAnnee: [CGFloat] = [
//        CGFloat(0),
//        CGFloat(0.1),
//        CGFloat(0.9)
//    ]
//    @State var ca: [CGFloat] = [
//        CGFloat(0.4),
//        CGFloat(0.2),
//        CGFloat(0.7)
//    ]
//    let Mois: String = "Année :"
//    var body: some View {
//        ScrollView {
//            VStack {
//                Section {
//                    MaxCA(max: Int(max))
//                    HStack{
//                        TextField("Votre Chiffre d'Affaire ?", value: $ajout, format: .currency(code: ""))
//                            .keyboardType(.decimalPad)
//                            .padding()
//                        if prevent == true {
//                            Text(message)
//                        } else {
//                            Text("\(Int(ajout))")
//                        }
//                    Button(action : {
//                        clavier.toggle()
//                        if ajout == CGFloat() {
//                            prevent = true
//                            message = "Erreur"
//                        } else if ajout/max > 1.0 {
//                            prevent = true
//                            message = "Vous dépassez le seuil maximum"
//                            caAnnee.append(CGFloat(1.0))
//                        } else {
//                            prevent = false
//                            caAnnee.append(CGFloat(ajout/max))
//                        }
//                    }) {
//                        Image(systemName: "keyboard.chevron.compact.down")
//                    }
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    }
//                }
//                Section {
//                    MaxCA2(max: Int(maxSecond))
//                    HStack{
//                        TextField("Votre Chiffre d'Affaire ?", value: $ajouter, format: .currency(code: ""))
//                            .keyboardType(.decimalPad)
//                            .padding()
//                        if prevent == true {
//                            Text(message)
//                        } else {
//                            Text("\(Int(ajouter))")
//                        }
//                    Button(action : {
//                        clavier.toggle()
//                        if ajouter == CGFloat() {
//                            prevent = true
//                            message = "Erreur"
//                        } else if ajout/maxSecond > 1.0 {
//                            prevent = true
//                            message = "Vous dépassez le seuil maximum"
//                            caAnnee.append(CGFloat(1.0))
//                        } else {
//                            prevent = false
//                            ca.append(CGFloat(ajouter/maxSecond))
//                        }
//                    }) {
//                        Image(systemName: "keyboard.chevron.compact.down")
//                    }
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    }
//                }
//                Button("Animate") {
//                    withAnimation(.easeInOut(duration: 2)) {
//                        self.on.toggle()
//                    }
//                }
//                HStack{
//                    Text(Mois.capitalized)
//                    Text(Date.now, format: .dateTime.year())
//                }
//                ZStack{
//                    LineGraph(dataPoints: caAnnee)
//                        .trim(to: on ? 1 : 0)
//                        .stroke(Color.blue, lineWidth: 5)
//                        .aspectRatio(16/9, contentMode: .fit)
//                    LineGraph(dataPoints: ca)
//                        .trim(to: on ? 1 : 0)
//                        .stroke(Color.green, lineWidth: 5)
//                        .aspectRatio(16/9, contentMode: .fit)
//
//                }.border(Color.gray, width: 1)
//                    .padding()
//            }
//        }
//    }
//}
//
