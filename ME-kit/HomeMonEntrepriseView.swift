//
//  HomeMonEntrepriseView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI
import Combine

struct HomeMonEntrepriseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMonEntrepriseView()
    }
}
//////////////////
///
///

struct HomeMonEntrepriseView: View {
    @State private var selectorIndex = 0
    @State private var numbers = ["Mes données d'Entreprise","Mon CA et Mes Docs"]
    var element = Doc(texte: "")
    @State var documents = [
        Doc(texte: "KBIS.pdf")
    ]
    var body: some View {
        NavigationView{
            VStack {
                Picker("Numbers", selection: $selectorIndex) {
                    ForEach(0 ..< numbers.count) { index in
                        Text(self.numbers[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text(numbers[selectorIndex]).padding()
                if selectorIndex == 0 {
                    StructureResumeInfos(affichage: true)
                } else {
                    ScrollView{
                        HStack{
                            Text("Chiffre d'Affaire :")
                            Spacer()
                        }.padding()
                        ProgressingView().padding()
                        
                        HStack {
                            Text("Mes Documents").padding()
                            Spacer()
                            Button(action: {
                                self.documents.append(Doc(texte: "Greffe.pdf"))
                            }) {
                                ZStack {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 44, weight: .bold))
                                        .foregroundColor(Color("greenMEkit"))
                                }
                                .padding()
                            }
                            Spacer()
                        }.padding()
                        
                        ForEach(documents) { docSup in
                            NavigationLink(destination: DetailDocumentView(element:docSup)) {
                                HStack{
                                    CardView(element: docSup)
                                    Spacer()
                                }
                            }.frame(height: 150)
                        }
                    }
                    
                }
                Spacer()
            }.navigationTitle("Mon Entreprise")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Modale
struct Modifieur: View {
    @Environment(\.dismiss) var dismiss
    @State var donneeNom : String
    @State var donneeLieu : String
    @State var donneeSiret : Int
    @State var dateDebutDActivite = Date()
    @State var selectedType : TypeDActivite
    @State var selectedSecteur : SecteurDActivite
    @State var selectedAccre : Reponses
    @State var selectedActivitePrincipal : Reponses
    @State var selectedImpot : Reponses
    @Binding var nomEntreprise : String
    @Binding var siret : Int
    @Binding var domiciliation : String
    @Binding var debutActivite : String
    @Binding var type : TypeDActivite
    @Binding var secteur : SecteurDActivite
    @Binding var accre : Reponses
    @Binding var activitePrincipal : Reponses
    @Binding var impot : Reponses
    var body: some View {
        VStack {
            Button(){
                dismiss()
            } label: {
                Image(systemName: "clear.fill")
                
            } .font(.title)
                .foregroundColor(Color("greenMEkit"))
                .padding()
            ScrollView{
                Group{
                    Text("La dénomination de mon entreprise").padding(.leading)
                    TextField("Nom de mon Entreprise", text: $donneeNom).background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    HStack{
                        Text("Siret :").padding(.leading)
                        TextField("Quel est le siret de ta société?", value: $donneeSiret, formatter: formatSiret)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }.border(Color("greenMEkit"))
                    Text("Domiciliation").padding(.leading)
                    TextField("Domiciliation de votre entreprise", text: $donneeLieu).background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    DatePicker("Date début d'activité", selection: $dateDebutDActivite, displayedComponents: [.date])
                        .padding()
                    HStack{
                        Section(header: Text("Secteur d'activité")){
                            Spacer()
                            Picker("Quel est votre secteur d'activité ?", selection: $selectedSecteur, content: {
                                ForEach(SecteurDActivite.allCases, content: { activite in
                                    Text(activite.rawValue.capitalized)
                                })
                            })
                        }
                        
                    }.padding()
                    HStack{
                        Section(header: Text("Type d'Activité")){
                            Spacer()
                            Picker("Quel est votre type d'activité ?", selection: $selectedType, content: {
                                ForEach(TypeDActivite.allCases, content: { activite in
                                    Text(activite.rawValue.capitalized)
                                })
                            })
                        }
                        
                    }.padding()
                }
                HStack{
                    Section(header: Text("ACCRE")){
                        Spacer()
                        Picker("bénificiez-vous du dispositif de l'ACCRE ?", selection: $selectedAccre, content: {
                            ForEach(Reponses.allCases, content: { reponse in
                                Text(reponse.rawValue.capitalized)
                            })
                        })
                    }
                    
                }.padding()
                HStack{
                    Section(header: Text("Activité Principal")){
                        Spacer()
                        Picker("est-ce qu'il s'agit de votre activité principal?", selection: $selectedActivitePrincipal, content: {
                            ForEach(Reponses.allCases, content: { reponse in
                                Text(reponse.rawValue.capitalized)
                            })
                        })
                    }
                    
                }.padding()
                HStack{
                    Section(header: Text("Impôt Libératoire")){
                        Spacer()
                        Picker("Avez-vous des Impôts Libératoires?", selection: $selectedImpot, content: {
                            ForEach(Reponses.allCases, content: { reponse in
                                Text(reponse.rawValue.capitalized)
                            })
                        })
                    }
                    
                }.padding()
                
                Button(action: {
                    //                    if donneeNom.isEmpty || donneeSiret == Int() || donneeLieu.isEmpty {
                    //                        if donneeNom.isEmpty && donneeSiret == Int() && donneeLieu.isEmpty {
                    //                            nomEntreprise = entrepriseParDefaut.nomination
                    //                            siret = entrepriseParDefaut.Siret
                    //                            domiciliation = entrepriseParDefaut.domiciliation
                    //                        } else if donneeNom.isEmpty{
                    //                            nomEntreprise = entrepriseParDefaut.nomination
                    //                            siret = donneeSiret
                    //                            domiciliation = donneeLieu
                    //                        } else if donneeLieu.isEmpty {
                    //                            nomEntreprise = donneeNom
                    //                            siret = entrepriseParDefaut.Siret
                    //                            domiciliation = donneeLieu
                    //                        } else {
                    //
                    //                        }
                    //                    } else {
                    nomEntreprise = donneeNom
                    siret = donneeSiret
                    domiciliation = donneeLieu
                    debutActivite = dateFormatter.string(from: dateDebutDActivite)
                    type = selectedType
                    secteur = selectedSecteur
                    accre = selectedAccre
                    activitePrincipal = selectedActivitePrincipal
                    impot = selectedImpot
                    //                    }
                    dismiss()
                }) {
                    Text("Valider").foregroundColor(.white)
                        .padding()
                }
                .background(RoundedRectangle(cornerRadius: 50).foregroundColor(Color("greenMEkit")))
            }
        }.padding()
    }
}

struct ProgressingView: View {
    @State var CA = Double()
    @State var valueCA = Double()
    var body: some View {
        VStack {
            HStack{
                NumberEntryField(value: self.$valueCA).background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("\(Int(CA))").padding()
                Button(){
                    CA = valueCA
                } label: {
                    Image(systemName: "plus").font(.title3)
                        .foregroundColor(Color("greenMEkit"))
                }
            }
            if CA >= 720000 {
                Progression(etatDeProgression: CA/720000.0, pourcentage: 100*Int(CA)/720000, color: .red)
            } else if CA >=  500000  {
                Progression(etatDeProgression: CA/720000.0, pourcentage: 100*Int(CA)/720000, color: .orange)
            } else if CA >= 5000 {
                Progression(etatDeProgression: CA/720000.0, pourcentage: 100*Int(CA)/720000, color: .green)
            } else if CA == Double() || CA == 0 {
                Progression(etatDeProgression: 0.0, pourcentage: 0, color: .green)
            } else if CA < 5000{
                Progression(etatDeProgression: 0.1, pourcentage: 1, color: .green)
            } else {
                Progression(etatDeProgression: 0.0, pourcentage: 0, color: .green)
                Text("Erreur")
            }
        }
    }
}

struct Progression: View {
    @State var etatDeProgression : Double
    @State var pourcentage : Int
    @State var color : Color
    var body: some View {
        HStack{
            ProgressView(value: etatDeProgression)
                .accentColor(color)
            Text("\(pourcentage) %")
        }.progressViewStyle(DarkBlueShadowProgressViewStyle(color: color))
    }
}
struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    @State var color : Color
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 250, height: 28)
                .foregroundColor(.gray)
                .overlay(Color.black.opacity(0.5)).cornerRadius(14)
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 28)
                .foregroundColor(color)
        }
        .padding()
    }
}
struct NumberEntryField : View {
    @State private var enteredValue : String = ""
    @Binding var value : Double
    
    var body: some View {
        return TextField("", text: $enteredValue)
            .onReceive(Just(enteredValue)) { typedValue in
                if let newValue = Double(typedValue) {
                    self.value = newValue
                }
            }.onAppear(perform:{self.enteredValue = "\(self.value)"})
    }
}



