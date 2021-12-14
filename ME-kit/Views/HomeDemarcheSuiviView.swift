//
//  HomeDemarcheSuiviView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct HomeDemarcheSuiviView: View {
    
    private func nameOfDayFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "fr-FR")
        return dateFormatter.string(from: date)
    }
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
    
    /////////// Variables pour afficher date déclaration mensuel
    private var endDateOfMonthNameOfDay: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 2
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return nameOfDayFormat(date: endOfMonth)
    }
    private var endDateOfMonthMonth: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 2
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return monthFormat(date: endOfMonth)
    }
    private var endDateOfMonthDay: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 2
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return dayFormat(date: endOfMonth)
    }
    
    /////////// Variables pour afficher date déclaration trimestriel
    let components = Calendar.current.dateComponents([.month, .year], from: Date.now)
    @State private var currentDate = Date()
    var april : String = "30 avril"
    var july : String = "31 juillet"
    var october : String = "31 octobre"
    var january : String = "31 janvier"
    @State var isActive : Bool = false
//    var echeanceURSSAF : String = ""
    
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
                        
                        titreTypeEtape(label: "MES DEMARCHES RECURRENTES")
                            .padding(.leading, 50.0)
                        
                        //                        VStack (alignment: .leading) {
                        NavigationLink(destination: DetailEtapeView(etape: etape9, shouldPopToRootView: self.$isActive), isActive: $isActive) {
                            //                                VStack {
                            
                            
//                            if entrepriseParDefaut.frequenceDeclURSSAF.rawValue == "mensuel" {
//                                echeanceURSSAF = "COUCOU"
                                
                                //endDateOfMonthNameOfDay + " " + endDateOfMonthDay + " " + endDateOfMonthMonth
//                            }
                            
                            CercleVertAFaire(text: etape9.name, echeance: "COUCOU")
                            //                                    .onTapGesture {
                            //                                        isActive = true
                            //                                    }
                            
                            //                                    HStack{
                            //                                        Text("""
                            //                            **Prochaine déclaration le:**
                            //                            \(endDateOfMonthNameOfDay)  \(endDateOfMonthDay)  \(endDateOfMonthMonth)
                            //                            """)
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
                            // Si trimestriel
                            //                                    HStack{
                            //                                        if components.month == 1 || components.month == 2 || components.month == 3{
                            //                                            Text("""
                            //                                            **Prochaine déclaration le:**
                            //                                            \(april)
                            //                                            """)
                            //                                        }
                            //                                        else if components.month == 4 || components.month == 5 || components.month == 6{
                            //                                            Text("""
                            //                                            **Prochaine déclaration le:**
                            //                                            \(july)
                            //                                            """)
                            //                                        }
                            //                                        else if components.month == 7 || components.month == 8 || components.month == 9{
                            //                                            Text("""
                            //                                            **Prochaine déclaration le:**
                            //                                            \(october)
                            //                                            """)
                            //                                        }
                            //                                        else {
                            //                                            Text("""
                            //                                            **Prochaine déclaration le:**
                            //                                            \(january)
                            //                                            """)
                            //                                        }
                            //                                        //si 1ere declaration
                            //                                        //1er trim : 31 juillet
                            //                                        //2e trim : 31 octobre
                            //                                        //3e trim : 31 janvier
                            //                                        //4e trim : 30 avril
                            //                                    }
                            //                                }
                            
                        }
                        NavigationLink(destination: DetailEtapeView(etape: etape10, shouldPopToRootView: self.$isActive), isActive: $isActive) {
                            //                                VStack {
                            CercleVertAFaire(text: etape10.name, echeance: etape10.echeance)
                            //                                    .onTapGesture {
                            //                                        isActive = true
                            //                                    }
                            
                            
                            //                                    HStack{
                            //                                        Text("")
                            //                                        /////////////////////////////////////////// URSSAF + CA + IMPOTS si versement liberatoire
                            //                                        //si mensuel et 1ere fois
                            //                                        //janvier - 31 mai
                            //                                        //février - 30 juin
                            //                                        // mars - 31 juillet
                            //                                        // avril - 31 août
                            //                                        // mai - 30 septembre
                            //                                        // juin - 31 octobre
                            //                                        // juillet - 30 novembre
                            //                                        // août - 31 décembre
                            //                                        // septembre - 31 janvier
                            //                                        // octobre - 28 février
                            //                                        // novembre - 31 mars
                            //                                        // décembre - 30 avril
                            //                                        //
                            //                                        //si trimestriel et 1ere fois
                            //                                        // 1er trimestre (janvier-mars) - 31 juillet
                            //                                        // 2e trimestre (avril-juin) - 31 octobre
                            //                                        // 3e trimestre (juillet-septembre) - 31 janvier
                            //                                        // 4e trimestre (octobre-décembre) - 30 avril
                            //
                            //
                            //                                        /////////////////////////////////////////// IMPOTS si pas versement liberatoire
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
                            //                                    }
                            
                            //                                }
                            
                            
                        }
                        NavigationLink(destination: DetailEtapeView(etape: etape11, shouldPopToRootView: self.$isActive), isActive: $isActive) {
                            //                                VStack {
                            CercleVertAFaire(text: etape11.name, echeance: etape11.echeance)
                            //                                    HStack{
                            //                                        Text("")
                            //                                        /////////////////////////////////////////////CFE
                            //                                        ///15 decembre
                            //                                        ///possibilité versement moitié  30 juin
                            //                                        ///
                            //                                        ///dateComponents.year = 2022
                            //                                        // dateComponents.month = 12
                            //                                        // dateComponents.day = 15
                            //                                        ///
                            //
                            //                                    }
                        }
                        
                        
                        //                            }
                        
                        //afficher le bon chiffre dans le titre
                        titreTypeEtape(label: "CA > 34 400€")
                            .padding(.leading, 50.0)
                        
                        //ajouter condition si CA > XX afficher ce bloc en vert
                        NavigationLink(destination: DetailEtapeView(etape: etapeTVA11, shouldPopToRootView: self.$isActive),
                                       isActive: $isActive) {
                            CercleGrisAFaire(text: etapeTVA11.name)
                                .onTapGesture {
                                    isActive = true
                                }
                        }
                        
                        //CLÔTURER MON ENTREPRISE
                        titreTypeEtape(label: "CA > 72 600€ OU CA = 0€")
                            .padding(.leading, 50.0)
                        
                        //ajouter condition si CA > XX afficher ce bloc
                        NavigationLink(destination: DetailEtapeView(etape: etapeCloture12, shouldPopToRootView: self.$isActive),
                                       isActive: $isActive) {
                            CercleGrisVide(text: etapeCloture12.name)
                                .onTapGesture {
                                    isActive = true
                                }
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
//}


struct titreTypeEtape: View {
    let label: String
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .stroke(.gray, lineWidth: 2.0)
                .frame(width: 290.0, height: 30.0, alignment: .center)
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
