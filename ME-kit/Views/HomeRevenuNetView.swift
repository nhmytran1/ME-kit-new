import SwiftUI

struct HomeRevenuNetView: View {
    @StateObject var listViewModel: FeesListViewModel = FeesListViewModel()
    @StateObject var entreprise = entrepriseParDefaut
    @State var chiffreAffaire = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        StructureRectangle(largueur: 350, hauteur: 200)
                        //                    StructureBlocInfosRevenu(valeurDate: entreprise.dateeDebutActivite, valeurSecteur: entreprise.secteur.rawValue, valeurType: entreprise.typeActivite.rawValue, valeurAccre: entreprise.ACCRE.rawValue, valeurActPrincipal: entreprise.activitePrincipal.rawValue, valeurImpot: entreprise.impot.rawValue)
                        //                    StructureBlocInfosRevenu(valeurDate: <#T##String#>, valeurSecteur: <#T##String#>, valeurType: <#T##String#>, valeurAccre: <#T##String#>, valeurActPrincipal: <#T##String#>, valeurImpot: <#T##String#>)
                    }
                    Text("Simulateur de revenu Net")
                        .font(.title)
                        .fontWeight(.ultraLight)
                        .italic()
                        .padding()
                    ZStack {
                        //StructureRectangle(largueur: 350, hauteur: 350)
                        VStack(spacing: 20) {
                            Text("Chiffre d'affaires :")
                            ZStack {
                                StructureRectangle(largueur: 300, hauteur: 50)
                                    .padding(-20)
                                //TextField("Votre chiffre d'affaires...", text: $chiffreAffaire)
                                Text(String(format:"%.2f",entreprise.CA))
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
                            Text("Total des charges : ")
                            ZStack {
                                StructureRectangle(largueur: 300, hauteur: 50)
                                    .padding(-20)
                                NavigationLink(destination: FeesListView()) {
                                    Text("\(listViewModel.getValue())€")
                                }
                            }
                            Text("Revenu Net :")
                            ZStack {
                                StructureRectangle(largueur: 300, hauteur: 50)
                                    .padding(-20)
                                VStack {
                                    Text(String(format: "%.2f", (getAllTaxes()-listViewModel.getValueInt())))
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Revenu net"))
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
