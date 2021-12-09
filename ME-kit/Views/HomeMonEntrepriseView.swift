import SwiftUI

struct HomeMonEntrepriseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMonEntrepriseView()
    }
}

struct HomeMonEntrepriseView: View {
    @State private var selectorIndex = 0
    @State private var numbers = ["Mes données d'Entreprise","Mon CA et Mes Docs"]
    var element = Doc(texte: "", dateDoc: Date())
    @State var documents = [
        Doc(texte: "KBIS.pdf", dateDoc: Date())
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
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
                        if entrepriseParDefaut.domiciliation == "DOM-TOM"
                        {
                            if entrepriseParDefaut.typeActivite == .ActiviteDeVente {
                                MaxCA(max: 100000)
                                ProgressingView(max: 100000).padding()
                            } else if entrepriseParDefaut.typeActivite == .PrestationDeServices {
                                MaxCA2(max: 50000)
                                ProgressingView(max: 50000).padding()
                            } else {
                                MaxCA(max: 100000)
                                ProgressingView(max: 100000).padding()
                                MaxCA2(max: 50000)
                                ProgressingView(max: 50000).padding()
                            }
                            
                        } else {
                            if entrepriseParDefaut.secteur == .Commerciale {
                                MaxCA(max: 85800)
                                ProgressingView(max: 85800).padding()
                            } else if entrepriseParDefaut.secteur == .Artisanale || entrepriseParDefaut.secteur == .Liberales {
                                MaxCA2(max: 34400)
                                ProgressingView(max: 34400)
                                
                            } else {
                                VStack{
                                    MaxCA(max: 85800)
                                    ProgressingView(max: 85800)
                                    MaxCA2(max: 34400)
                                    ProgressingView(max: 34400)
                                }
                            }
                        }
                        
                        HStack {
                            Text("Mes Documents").padding()
                            Spacer()
                            Button(action: {
                                self.documents.append(Doc(texte: "Greffe.pdf", dateDoc: Date.now))
                            }) {
                                ZStack {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 44, weight: .bold))
                                        .foregroundColor(Color("greenMEkit"))
                                }
                            }
                        }
                        
                        LazyVGrid(columns: columns) {
                            ForEach(documents) { docSup in
                                NavigationLink(destination: DetailDocumentView(element:docSup)) {
                                    ZStack {
                                        VStack{
                                            Button{
                                               // documents.remove(at: \.self.id(_documents))
                                            } label: {
                                                    Image(systemName: "multiply.circle").resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("greenMEkit"))
                                                        .frame(width: 44, height: 44)
                                            }
                                            CardView(element: docSup)
                                        }.overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(lineWidth: 1)
                                                .foregroundColor(.black)
                                            
                                    )
                                    }
                                }
                            }
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
    @State var entreprise = entrepriseParDefaut
    @State var donneeNom : String
    @State var donneeLieu : String
    @State var donneeSiret : Int
    @State var dateDebutDActivite = Date()
    @State var selectedType : TypeDActivite
    @State var selectedSecteur : SecteurDActivite
    @State var selectedAccre : Reponses
    @State var selectedActivitePrincipal : Reponses
    @State var selectedImpot : Reponses
    @StateObject var nomEntreprise = entrepriseParDefaut
    //@ObservedObject var input = TextLimiter(limit: 5)
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
                    Text("Domiciliation *").padding(.leading)
                    Text("* S'il se trouve à la Guadeloupe, la Martinique ou à La Réunion, veuillez inscrire DOM-TOM").foregroundColor(.gray)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
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
                    entrepriseParDefaut.nomination = donneeNom
                    entrepriseParDefaut.Siret = donneeSiret
                    entrepriseParDefaut.domiciliation = donneeLieu.uppercased()
                    entrepriseParDefaut.dateeDebutActivite = dateFormatter.string(from: dateDebutDActivite)
                    entrepriseParDefaut.typeActivite = selectedType
                    entrepriseParDefaut.secteur = selectedSecteur
                    entrepriseParDefaut.ACCRE = selectedAccre
                    entrepriseParDefaut.activitePrincipal = selectedActivitePrincipal
                    entrepriseParDefaut.impot = selectedImpot
                    
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
    @State var CA = entrepriseParDefaut.CA
    @State var valueCA = Double()
    @State var max : Double
    var body: some View {
        VStack {
            HStack{
                TextField("Quel est votre CA ?", value: self.$valueCA,formatter: formatSiret).background(RoundedRectangle(cornerRadius: 50)
                                                                                                            .keyboardType(.numberPad).foregroundColor(.white))
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
            if CA >= max {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .red)
            } else if CA >=  max/2  {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .orange)
            } else if CA < max/2 {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .green)
            } else if CA == Double() || CA == 0 {
                Progression(etatDeProgression: 0.0, pourcentage: 0, color: .green)
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

struct MaxCA: View {
    @State var max : Int
    var body: some View {
        HStack{
            Text("Mon Chiffre d'Affaire pour une activité de vente (max: \(max) € / 1 an):").padding(.leading)
            Spacer()
        }
    }
}
struct MaxCA2: View {
    @State var max : Int
    var body: some View {
        HStack{
            Text("Mon Chiffre d'Affaire pour la prestation de service(max: \(max) € / 1 an):").padding(.leading)
            Spacer()
        }
    }
}
