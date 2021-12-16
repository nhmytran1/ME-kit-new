//
//  HomeDemarcheSuiviView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheSuiviView: View {
    
    //    private func nameOfDayFormat(date: Date) -> String {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "EEEE"
    //        dateFormatter.locale = Locale(identifier: "fr-FR")
    //        return dateFormatter.string(from: date)
    //    }
    private func monthFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "fr-FR")
        return dateFormatter.string(from: date)
    }
    private func dayFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        dateFormatter.locale = Locale(identifier: "fr-FR")
        return dateFormatter.string(from: date)
    }
    
    //Variables pour afficher date déclaration mensuel
    //    private var endDateOfMonthNameOfDay: String {
    //        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
    //        components.month = (components.month ?? 0) + 2
    //        components.hour = (components.hour ?? 0) - 1
    //        let endOfMonth = Calendar.current.date(from: components)!
    //        return nameOfDayFormat(date: endOfMonth)
    //    }
    //Variables pour afficher date déclaration mensuelle URSSAF
    private var endDateOfMonthMonthURSSAF: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 2
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return monthFormat(date: endOfMonth)
    }
    private var endDateOfMonthDayURSSAF: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 2
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return dayFormat(date: endOfMonth)
    }
    
    //Variables pour afficher date déclaration mensuelle IMPOTS
    private var endDateOfMonthMonthImpots: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 3
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return monthFormat(date: endOfMonth)
    }
    private var endDateOfMonthDayImpots: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 3
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return dayFormat(date: endOfMonth)
    }
    
    
    //Variables pour afficher date déclaration trimestriel
    let components = Calendar.current.dateComponents([.month, .year], from: Date.now)
    @State private var currentDate = Date()
    var april : String = "30 avril"
    var july : String = "31 juillet"
    var october : String = "31 octobre"
    var january : String = "31 janvier"
    @State var isActive : Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                //BARRE DE SUIVI LATERALE
                HStack {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 3, height: 400)
                    Spacer()
                }
                .padding(.leading, 43.0)
                
                HStack {
                    VStack (alignment: .leading) {
                        CercleGrisFait(text: "Création")
                        
                        titreTypeEtapeActif(label: "Démarches récurrentes")
                            .padding(.leading, 50.0)
                        
                        
                        //DECLARATION URSSAF
                        NavigationLink(destination: DetailEtapeView(etape: etape9, shouldPopToRootView: self.$isActive)) {
                            
                            if entrepriseParDefaut.frequenceDecl == .mensuel {
                                CercleVertAFaire(text: etape9.name, echeance: "\(endDateOfMonthDayURSSAF) \(endDateOfMonthMonthURSSAF)")
                            }
                            else {
                                if components.month == 1 || components.month == 2 || components.month == 3 {
                                    CercleVertAFaire(text: etape9.name, echeance: april)
                                }
                                else if components.month == 4 || components.month == 5 || components.month == 6 {
                                    CercleVertAFaire(text: etape9.name, echeance: july)
                                }
                                else if components.month == 7 || components.month == 8 || components.month == 9 {
                                    CercleVertAFaire(text: etape9.name, echeance: october)
                                }
                                else {
                                    CercleVertAFaire(text: etape9.name, echeance: january)
                                }
                            }
                            
                            //                                    .onTapGesture {
                            //                                        isActive = true
                            //                                    }
                            
                            //SI FREQUENCE MENSUELLE ET 1E DECLARATION
                            //                                        // premiere declaration mensuelle
                            //                                        // ajouter bouton 1ere declaration?
                            //                                        // if 1ere declarattion, else if
                            //                                        if components.month == 1 {
                            //                                            Text("31 mai")
                            //                                        }
                            //                                        else if components.month == 2 {
                            //                                            Text("31 juin")
                            //                                        }
                            //                                        else if components.month == 3 {
                            //                                            Text("31 juillet")
                            //                                        }
                            //                                        else if components.month == 4 {
                            //                                            Text("31 août")
                            //                                        }
                            //                                        else if components.month == 5 {
                            //                                            Text("31 septembre")
                            //                                        }
                            //                                        else if components.month == 6 {
                            //                                            Text("31 octobre")
                            //                                        }
                            //                                        else if components.month == 7 {
                            //                                            Text("31 novembre")
                            //                                        }
                            //                                        else if components.month == 8 {
                            //                                            Text("31 décembre")
                            //                                        }
                            //                                        else if components.month == 9 {
                            //                                            Text("31 janvier")
                            //                                        }
                            //                                        else if components.month == 10{
                            //                                            Text("31 février")
                            //                                        }
                            //                                        else if components.month == 11{
                            //                                            Text("31 mars")
                            //                                        }
                            //                                        else if components.month == 12 {
                            //                                            Text("31 avril")
                            //                                        }
                            //                                    }
                            //////////  SI TRIMESTRIEL ET 1E DECLARATION
                            //                                        //si 1ere declaration
                            //                                        //1er trim : 31 juillet
                            //                                        //2e trim : 31 octobre
                            //                                        //3e trim : 31 janvier
                            //                                        //4e trim : 30 avril
                            //                                    }
                            //                                }
                            
                        }
                        
                        
                        //DECLARATION IMPÔTS
                        NavigationLink(destination: DetailEtapeView(etape: etape10, shouldPopToRootView: self.$isActive)) {
                            
                            if entrepriseParDefaut.frequenceDecl == .mensuel {
                                CercleVertAFaire(text: etape10.name, echeance: "\(endDateOfMonthDayImpots) \(endDateOfMonthMonthImpots)")
                            }
                            else {
                                if components.month == 1 || components.month == 2 || components.month == 3 {
                                    CercleVertAFaire(text: etape10.name, echeance: july)
                                }
                                else if components.month == 4 || components.month == 5 || components.month == 6 {
                                    CercleVertAFaire(text: etape10.name, echeance: october)
                                }
                                else if components.month == 7 || components.month == 8 || components.month == 9 {
                                    CercleVertAFaire(text: etape10.name, echeance: january)
                                }
                                else {
                                    CercleVertAFaire(text: etape10.name, echeance: april)
                                }
                            }
                            
                            //                                    .onTapGesture {
                            //                                        isActive = true
                            //                                    }
                            
                            /////////////////////////////////////////// IMPOTS si pas versement liberatoire
                            //                                        ///declaration mai-juin
                            //                                        ///paiement septembre
                            //                                        ///
                            //                                        ///dateComponents.year = 2022
                            //                                        // dateComponents.month = 05
                            //                                        // dateComponents.day = 15 ??
                            //                                        ///
                            //                                        //////dateComponents.year = 2022
                            //                                        // dateComponents.month = 09
                            //                                        // dateComponents.day = 15 ??
                            //                                        ///
                            
                        }
                        
                        //DECLARATION CFE
                        NavigationLink(destination: DetailEtapeView(etape: etape11, shouldPopToRootView: self.$isActive)) {
                            
                            CercleVertAFaire(text: etape11.name, echeance: etape11.echeance)
                            ///possibilité versement moitié  30 juin
                            ///
                            ///dateComponents.year = 2022
                            // dateComponents.month = 12
                            // dateComponents.day = 15
                        }
                        
                        
                        //ajouter condition si CA > XX afficher ce bloc en vert
                        NavigationLink(destination: DetailEtapeView(etape: etapeTVA12, shouldPopToRootView: self.$isActive)) {
                            if entrepriseParDefaut.CA <= 36500.0 {
                                VStack (alignment: .leading) {
                                    titreTypeEtapeInactif(label: "Seuil TVA dépassé")
                                        .padding(.leading, 50.0)
                                    CercleGrisAFaire(text: etapeTVA12.name)
                                }
                            }
                            else {
                                VStack (alignment: .leading) {
                                    titreTypeEtapeActif(label: "Seuil TVA majoré dépassé")
                                        .padding(.leading, 50.0)
                                    CercleVertAFaire(text: etapeTVA12.name, echeance: etapeTVA12.echeance)
                                }
                            }
                            //                                .onTapGesture {
                            //                                    isActive = true
                            //                                }
                        }
                        
                        ///////////////////////////////////////////////TVA
                        ///activités artisanales et prestations de services:
                        ///CA: 72 600€
                        ///seuil franchise: 34 400€ (47,38% du CA)
                        ///seuil majoré : 36 500€ (50,27% du CA)
                        ///
                        //////activités commerciales::
                        ///CA: 176 200€
                        ///seuil franchise: 85 800€ (48,7% du CA)
                        ///seuil majoré : 94 300€ (53,52% du CA)
                        ///
                        ///si en dessous seuil franchise = NE PAIE PAS
                        ////activités artisanales et prestations de services:
                        ///< 34400
                        ///////activités commerciales::
                        ///< 85800
                        ///
                        ///si entre seuil franchise et seuil majoré = NE PAIE PAS
                        ////activités artisanales et prestations de services:
                        ///  >34400 && <36500
                        ///
                        ///
                        ///////activités commerciales::
                        /// >85800 && <94300
                        ///
                        ///
                        ///si au dessus seuil majoré = PAIE
                        ////activités artisanales et prestations de services:
                        /// >36500
                        ///////activités commerciales::
                        /// >94300
                        ///
                        ///si 2eme année entre seuil franchise et seuil majoré OU au dessus seuil majoré = PAIE
                        ////activités artisanales et prestations de services:
                        ///  >34400 && <36500 || >36500
                        ///////activités commerciales::
                        /// >85800 && <94300 || >94300
                        ///
                        ///
                    }
                    Spacer()
                }
                .padding(.leading, 15.0)
            }
            .navigationBarTitle(Text("Démarches"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink (destination: MesNotificationsView()) {
                        Image(systemName: "bell")
                    }.foregroundColor(Color("greenMEkit"))
                }
            }
        }
    }
}


struct titreTypeEtapeActif: View {
    let label: String
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("greenMEkit"), lineWidth: 2.0)
                .frame(width: 240.0, height: 30.0, alignment: .center)
            Text(label)
                .foregroundColor(Color("greenMEkit"))
                .padding()
        }
    }
}


struct titreTypeEtapeInactif: View {
    let label: String
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 2.0)
                .frame(width: 240.0, height: 30.0, alignment: .center)
            Text(label)
                .foregroundColor(.gray)
                .padding()
        }
    }
}


struct HomeDemarcheSuiviView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDemarcheSuiviView()
    }
}
