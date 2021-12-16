import SwiftUI

struct HomeMonEntrepriseView: View {
    @Binding var showOnboarding: Bool
    @FocusState private var clavier : Bool
    @State var document: FilesDocuments = FilesDocuments(message: "Hello, World!")
    @State private var isImporting: Bool = false
    @State var affichage : Bool = false
    @State private var selectorIndex = 0
    @State private var numbers = ["Mes données","Mon CA et mes docs"]
    @State var documents = [
        Doc(texte: "KBIS.pdf", dateDoc: Date.now)
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var caAnnee: [CGFloat] = [
        CGFloat(0)
    ]
    @State var ca: [CGFloat] = [
        CGFloat(0)
    ]
    @State var ajout : Double = entrepriseParDefaut.CA
    @State var ajouter : Double = Double()
    @State var valueCA : Double = Double()
    @State var valueCA2 : Double = Double()
    @State var prevent = "Veuillez renseigner au dessus votre chiffre d'affaires pour votre suivis annuel"
    @State var on : Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Picker("Numbers", selection: $selectorIndex) {
                    ForEach(0 ..< numbers.count) { index in
                        Text(self.numbers[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if selectorIndex == 0 {
                    ScrollView{
                    StructureResumeInfos(affichage: true)
                    NavigationLink(destination: DetailEtapeClotureView(showOnboarding: $showOnboarding, etape: etape13)){
                        BoutonPlein(label: "Clôturer son entreprise")
                            .padding()
                    }
                    }
                } else {
                    ScrollView{
                            if entrepriseParDefaut.domiciliation == .DomTom
                            {
                                if entrepriseParDefaut.typeActivite == .Mixte {
                                        MaxCA(max : 100000)
                                    HStack{
                                        TextField("Quel est votre CA ?", value: $ajout,format: .currency(code: ""))
                                            .background(RoundedRectangle(cornerRadius: 50)
                                                            .keyboardType(.numberPad).foregroundColor(.white))
                                            .textFieldStyle(.roundedBorder)
                                            .padding()
                                        Button(){
                                            clavier.toggle()
                                            entrepriseParDefaut.CA = ajout
                                            withAnimation(.easeInOut(duration: 2)) {
                                                on = true
                                            }
                                            valueCA = ajout
                                            if ajout/100000 > 1.0 {
                                                prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                caAnnee.append(CGFloat(1.0))
                                            } else {
                                                caAnnee.append(CGFloat(ajouter/100000))
                                                prevent = "\(entrepriseParDefaut.CA)"
                                            }
                                        } label: {
                                            Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                .foregroundColor(Color("greenMEkit")).padding()
                                        }
                                    }
                                    Text(prevent).padding()
                                    ProgressingView(CA: $valueCA, max: 100000)
                                    MaxCA2(max: 50000)
                                    HStack{
                                        TextField("Quel est votre CA ?", value: $ajouter,format: .currency(code: ""))
                                            .background(RoundedRectangle(cornerRadius: 50)
                                                            .keyboardType(.numberPad).foregroundColor(.white))
                                            .textFieldStyle(.roundedBorder)
                                            .padding()
                                        Button(){
                                            clavier.toggle()
                                            entrepriseParDefaut.CA = ajouter
                                            withAnimation(.easeInOut(duration: 2)) {
                                                on = true
                                            }
                                            valueCA2 = ajouter
                                            if ajouter/50000 > 1.0 {
                                                prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                ca.append(CGFloat(1.0))
                                            } else {
                                                ca.append(CGFloat(ajouter/50000))
                                                prevent = "\(entrepriseParDefaut.CA)"
                                            }
                                        } label: {
                                            Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                .foregroundColor(Color("greenMEkit")).padding()
                                        }
                                    }
                                    Text(prevent).padding()
                                    ProgressingView(CA: $valueCA2, max: 50000)
                                    ZStack{
                                        LineGraph(dataPoints: caAnnee)
                                            .trim(to: on ? 1 : 0)
                                            .stroke(Color.green, lineWidth: 5)
                                        LineGraph(dataPoints: ca)
                                            .trim(to: on ? 1 : 0)
                                            .stroke(Color.green, lineWidth: 5)
                                            .aspectRatio(16/9, contentMode: .fit)
                                            .border(Color.gray, width: 1)
                                    }
                                        .padding()
                                } else if entrepriseParDefaut.typeActivite == .PrestationDeServices {
                                        MaxCA2(max: 50000)
                                    HStack{
                                        TextField("Quel est votre CA ?", value: $ajout,format: .currency(code: ""))
                                            .background(RoundedRectangle(cornerRadius: 50)
                                                            .keyboardType(.numberPad).foregroundColor(.white))
                                            .textFieldStyle(.roundedBorder)
                                            .padding()
                                        Button(){
                                            clavier.toggle()
                                            entrepriseParDefaut.CA = ajout
                                            withAnimation(.easeInOut(duration: 2)) {
                                                on = true
                                            }
                                            valueCA = ajout
                                            if ajout/50000 > 1.0 {
                                                prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                caAnnee.append(CGFloat(1.0))
                                            } else {
                                                caAnnee.append(CGFloat(ajout/50000))
                                                prevent = "\(entrepriseParDefaut.CA)"
                                            }
                                        } label: {
                                            Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                .foregroundColor(Color("greenMEkit")).padding()
                                        }
                                    }
                                    Text(prevent).padding()
                                    ProgressingView(CA: $valueCA, max: 50000)
                                    LineGraph(dataPoints: caAnnee)
                                        .trim(to: on ? 1 : 0)
                                        .stroke(Color.green, lineWidth: 5)
                                        .aspectRatio(16/9, contentMode: .fit)
                                        .border(Color.gray, width: 1)
                                        .padding()
                                }
                            } else if entrepriseParDefaut.domiciliation == .France {
                                    if entrepriseParDefaut.typeActivite == .Mixte {
                                                MaxCA(max: 85800)
                                        HStack{
                                            TextField("Quel est votre CA ?", value: $ajout,format: .currency(code: ""))
                                                .background(RoundedRectangle(cornerRadius: 50)
                                                                .keyboardType(.numberPad).foregroundColor(.white))
                                                .textFieldStyle(.roundedBorder)
                                                .padding()
                                            Button(){
                                                clavier.toggle()
                                                entrepriseParDefaut.CA = ajout
                                                withAnimation(.easeInOut(duration: 2)) {
                                                    on = true
                                                }
                                                valueCA = ajout
                                                if ajout/85800 > 1.0 {
                                                    prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                    caAnnee.append(CGFloat(1.0))
                                                } else {
                                                    caAnnee.append(CGFloat(ajout/85800))
                                                    prevent = "\(entrepriseParDefaut.CA)"
                                                }
                                            } label: {
                                                Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                    .foregroundColor(Color("greenMEkit")).padding()
                                            }
                                        }
                                        Text(prevent).padding()
                                        ProgressingView(CA: $valueCA, max: 85800)
                                        MaxCA2(max: 34400)
                                        HStack{
                                            TextField("Quel est votre CA ?", value: $ajouter,format: .currency(code: ""))
                                                .background(RoundedRectangle(cornerRadius: 50)
                                                                .keyboardType(.numberPad).foregroundColor(.white))
                                                .textFieldStyle(.roundedBorder)
                                                .padding()
                                            Button(){
                                                clavier.toggle()
                                                entrepriseParDefaut.CA = ajouter
                                                withAnimation(.easeInOut(duration: 2)) {
                                                    on = true
                                                }
                                                valueCA = ajouter
                                                if ajouter/34400 > 1.0 {
                                                    prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                    ca.append(CGFloat(1.0))
                                                } else {
                                                    ca.append(CGFloat(ajouter/34400))
                                                    prevent = "\(entrepriseParDefaut.CA)"
                                                }
                                            } label: {
                                                Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                    .foregroundColor(Color("greenMEkit")).padding()
                                            }
                                        }
                                        Text(prevent).padding()
                                        ProgressingView(CA: $valueCA, max: 34400)
                                        ZStack{
                                            LineGraph(dataPoints: caAnnee)
                                                .trim(to: on ? 1 : 0)
                                                .stroke(Color.green, lineWidth: 5)
                                            LineGraph(dataPoints: ca)
                                                .trim(to: on ? 1 : 0)
                                                .stroke(Color.green, lineWidth: 5)
                                                .aspectRatio(16/9, contentMode: .fit)
                                                .border(Color.gray, width: 1)
                                        }
                                            .padding()
                                       
                                    } else if entrepriseParDefaut.secteur == .Commerciale {
                                            MaxCA(max: 85800)
                                        HStack{
                                            TextField("Quel est votre CA ?", value: $ajout,format: .currency(code: ""))
                                                .background(RoundedRectangle(cornerRadius: 50)
                                                                .keyboardType(.numberPad).foregroundColor(.white))
                                                .textFieldStyle(.roundedBorder)
                                                .padding()
                                            Button(){
                                                clavier.toggle()
                                                entrepriseParDefaut.CA = ajout
                                                withAnimation(.easeInOut(duration: 2)) {
                                                    on = true
                                                }
                                                valueCA = ajout
                                                if ajout/85800 > 1.0 {
                                                    prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                    caAnnee.append(CGFloat(1.0))
                                                } else {
                                                    caAnnee.append(CGFloat(ajout/85800))
                                                    prevent = "\(entrepriseParDefaut.CA)"
                                                }
                                            } label: {
                                                Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                    .foregroundColor(Color("greenMEkit")).padding()
                                            }
                                        }
                                        Text(prevent).padding()
                                        ProgressingView(CA: $valueCA, max: 34400)
                                        LineGraph(dataPoints: caAnnee)
                                            .trim(to: on ? 1 : 0)
                                            .stroke(Color.green, lineWidth: 5)
                                            .aspectRatio(16/9, contentMode: .fit)
                                            .border(Color.gray, width: 1)
                                            .padding()
                                    } else if entrepriseParDefaut.secteur == .Artisanale || entrepriseParDefaut.secteur == .Liberales {
                                            MaxCA2(max: 34400)
                                        HStack{
                                            TextField("Quel est votre CA ?", value: $ajout,format: .currency(code: ""))
                                                .background(RoundedRectangle(cornerRadius: 50)
                                                                .keyboardType(.numberPad).foregroundColor(.white))
                                                .textFieldStyle(.roundedBorder)
                                                .padding()
                                            Button(){
                                                clavier.toggle()
                                                entrepriseParDefaut.CA = ajout
                                                withAnimation(.easeInOut(duration: 2)) {
                                                    on = true
                                                }
                                                valueCA = ajout
                                                if ajout/34400 > 1.0 {
                                                    prevent = "Vous dépassez le seuil maximum (Vous serez majouré)"
                                                    caAnnee.append(CGFloat(1.0))
                                                } else {
                                                    caAnnee.append(CGFloat(ajout/34400))
                                                    prevent = "\(entrepriseParDefaut.CA)"
                                                }
                                            } label: {
                                                Image(systemName: "arrow.right.to.line.circle").font(.title3)
                                                    .foregroundColor(Color("greenMEkit")).padding()
                                            }
                                        }
                                        Text(prevent).padding()
                                        ProgressingView(CA: $valueCA, max: 34400)
                                        LineGraph(dataPoints: caAnnee)
                                            .trim(to: on ? 1 : 0)
                                            .stroke(Color.green, lineWidth: 5)
                                            .aspectRatio(16/9, contentMode: .fit)
                                            .border(Color.gray, width: 1)
                                            .padding()
                                           
                                    }
                            } else {
                                Text("Votre Chiffre d'affaire est de \(entrepriseParDefaut.CA)")
                            }
                        HStack {
                            Text("Mes Documents").padding()
                            Spacer()
                            Button(action: {
                                isImporting = true
                                self.documents.append(Doc(texte: "Greffe.pdf", dateDoc: Date.now))
                            }) {
                                ZStack {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 44, weight: .bold))
                                        .foregroundColor(Color("greenMEkit"))
                                }
                                .fileImporter(
                                    isPresented: $isImporting,
                                    allowedContentTypes: [.plainText],
                                    allowsMultipleSelection: false
                                ) { result in
                                    do {
                                        guard let selectedFile: URL = try result.get().first else { return }
                                        guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                                        
                                        document.message = message
                                    } catch {
                                        print ("Fail")
                                    }
                                }
                            }
                        }
                        LazyVGrid(columns: columns) {
                            ForEach(documents.indices, id : \.self) { index in
                                NavigationLink(destination: DetailDocumentView(element: documents[index])) {
                                    ZStack {
                                        VStack{
                                            HStack{
                                                Button{
                                                    documents.remove(at: index)
                                                } label: {
                                                    Image(systemName: "multiply.circle").resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("greenMEkit"))
                                                        .frame(width: 44, height: 44)
                                                }
                                            }
                                            CardView(element: documents[index])
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
    @FocusState private var clavier : Bool
    @State var entreprise = entrepriseParDefaut
    @State var donneeNom : String
    @State var donneeLieu : Pays
    @State var donneeSiret : Int
    @State var dateDebutDActivite = Date()
    @State var selectedType : TypeDActivite
    @State var selectedSecteur : SecteurDActivite
    @State var selectedAccre : Reponses
    @State var selectedActivitePrincipal : Reponses
    @State var selectedImpot : Reponses
    @State var selectedUrsaff : FrequenceDeclaration
    @StateObject var nomEntreprise = entrepriseParDefaut
    //@ObservedObject var input = TextLimiter(limit: 5)
    var body: some View {
        VStack {
            Button(){
                dismiss()
            } label: {
                BoutonVide(label: "Annuler")
                
            }.foregroundColor(Color("greenMEkit"))
                .padding()
            ScrollView{
                Group{
                    Text("La dénomination de mon entreprise").padding(.leading)
                    TextField("Nom de mon Entreprise", text: $donneeNom).onChange(of: donneeNom, perform: { value in
                        if value.count > 30 {
                            donneeNom = String(value.prefix(30))
                        }
                    }).background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    HStack{
                        Text("Siret :").padding(.leading)
                        TextField("Quel est le siret de ta société?", value: $donneeSiret, formatter: formatSiret)
                            .keyboardType(.numberPad)
                            .focused($clavier)
                        
                        Button(action : {
                            clavier.toggle()
                        }) {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    }.border(Color("greenMEkit"))
                    
                    Text("Domiciliation *").padding(.leading)
                    Text("* S'il se trouve à la Guadeloupe, la Martinique ou à La Réunion, veuillez inscrire DOM-TOM").foregroundColor(.gray)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    HStack{
                        Section(header: Text("Domiciliation")){
                            Spacer()
                            Picker("Quel est votre domiciliation ?", selection: $donneeLieu, content: {
                                ForEach(Pays.allCases, content: { lieu in
                                    Text(lieu.rawValue.capitalized)
                                })
                            })
                        }
                        
                    }.padding()
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
                    Section(header: Text("Fréquence URSAFF")){
                        Spacer()
                        Picker("Quel est votre fréquence de déclaration ?", selection: $selectedUrsaff, content: {
                            ForEach(FrequenceDeclaration.allCases, content: { ursaff in
                                Text(ursaff.rawValue.capitalized)
                            })
                        })
                    }
                    
                }.padding()
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
                    entrepriseParDefaut.domiciliation = donneeLieu
                    entrepriseParDefaut.dateeDebutActivite = dateDebutDActivite
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
            }.padding()
        }
    }
}

struct ProgressingView: View {
    @Binding var CA : Double
    @State var max : Double
    var body: some View {
        VStack {
//            HStack{
//                TextField("Quel est votre CA ?", value: self.$valueCA,formatter: formatCA)
//                    .background(RoundedRectangle(cornerRadius: 50)
//                                    .keyboardType(.numberPad).foregroundColor(.white))
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                Text("\(Int(CA)) €").padding()
//                Button(){
//                    CA = valueCA
//                } label: {
//                    Image(systemName: "arrow.right.to.line.circle").font(.title3)
//                        .foregroundColor(Color("greenMEkit")).padding()
//                }
//            }
            if CA == Double() || CA == 0 {
                Progression(etatDeProgression: 0.0, pourcentage: 0, color: .green)
            } else if CA < max/2 && CA > 0 {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .green)
            } else if CA >=  max/2  &&  CA < max {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .orange)
            } else if CA >= max {
                Progression(etatDeProgression: CA/max, pourcentage: Int(100*CA/max), color: .red)
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
            Text("Mon Chiffre d'Affaire pour une activité de vente (max: \(max) € / 1 an):")
                .padding(.leading)
            Spacer()
        }
    }
}
struct MaxCA2: View {
    @State var max : Int
    var body: some View {
        HStack{
            Text("Mon Chiffre d'Affaire pour la prestation de service(max: \(max) € / 1 an):")
                .padding(.leading)
            Spacer()
        }
    }
}

struct HomeMonEntrepriseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMonEntrepriseView(showOnboarding: .constant(true))
    }
}
