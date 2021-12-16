import SwiftUI

struct HomeRevenuNetView: View {
    @StateObject var listViewModel: FeesListViewModel = FeesListViewModel()
    @StateObject var entreprise = entrepriseParDefaut
    @State var chiffreAffaire = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Vos informations")
                        .font(.title2)
                        .padding(.top, 10)
                    //                    ZStack {
                    StructureResumeInfos(document: .constant(FilesDocuments(message: "")), affichage: false)
                    //                    }
                    ZStack {
                        //StructureRectangle(largueur: 350, hauteur: 350)
                        VStack(spacing: 15) {
                            //                            Text("Calculs")
                            //                                .font(.title2)
                            //                                .padding(.top, 10)
                            Divider()
                                .background(Color("greenMEkit"))
                                .padding(.horizontal, 40)
                                .padding(.top, 15)
                            HStack {
                                Spacer()
                                Text("ANNUEL")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 40)
                            }
                            Text("Chiffre d'affaires :")
                            ZStack {
                                StructureRectangle(largueur: 300, hauteur: 50)
                                    .padding(-20)
                                //TextField("Votre chiffre d'affaires...", text: $chiffreAffaire)
                                Text(String(format:"%.2f",entreprise.CA) + " €")
                                    .frame(width: 300, height: 50)
                                //.background(Color.secondary.opacity(0.2))
                                    .cornerRadius(20)
                                    .multilineTextAlignment(.center)
                                //                            Image(systemName: "eurosign.circle.fill")
                                //                                .frame(width: 80, height: 50)
                                //                                .background(Color.secondary.opacity(0.2))
                                //                                .cornerRadius(20)
                                //                                .foregroundColor(.secondary)
                            }
                            //                            HStack {
                            Text("Total des charges : ")
                            
                            //                            }
                            
                            
                            
                            NavigationLink(destination: FeesListView()) {
                                ZStack {
                                    StructureRectangle(largueur: 300, hauteur: 50)
                                        .padding(-20)
                                    HStack {
                                        Text("\(listViewModel.getValue()) €")
                                            .padding(.leading, 110)
                                        Image(systemName: "pencil")
                                            .multilineTextAlignment(.trailing)
                                            .padding(.leading, 70)
                                    }
                                }
                            }
                            Text("Revenu net :")
                            ZStack {
                                StructureRectangle(largueur: 300, hauteur: 50)
                                    .padding(-20)
                                VStack {
                                    Text(String(format: "%.2f", (getAllTaxes()-listViewModel.getValueInt())) + " €")
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Simulateur de revenu net"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .environmentObject(listViewModel)
    }
}

struct HomeRevenuNetView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRevenuNetView()
    }
}
