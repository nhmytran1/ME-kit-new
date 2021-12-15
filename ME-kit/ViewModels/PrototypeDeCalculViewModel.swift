//
//  PrototypeDeCalculViewModel.swift
//  ME-kit
//
//  Created by François-Xavier Méité on 13/12/2021.
//

import SwiftUI
var cotisations = 0.0
var fraisChambre = 0.0
var cfe = 0.0
var impotLiberatoire = 0.0
var totalTaxes = 0.0

struct PrototypeDeCalculViewModel: View {
    var body: some View {
        VStack {
            Text(String(format: "%.2f", totalTaxes))
//            Text("\(getCotisations())")
//            Text("\(getFraisDeChambre())")
//            Text("\(getCFE())")
//            Text("\(getImpotLiberatoire())")
            Text("\(getAllTaxes())")
        }
    }
}

    func getAllTaxes()-> Double {
        totalTaxes = ((getCotisations() + getFraisDeChambre() + getCFE() + getImpotLiberatoire()) * entrepriseParDefaut.CA) / 100
        return totalTaxes
    }

    func getImpotLiberatoire() -> Double {
        if entrepriseParDefaut.typeActivite == .ActiviteDeVente {
            impotLiberatoire = 1
        } else if entrepriseParDefaut.typeActivite == .PrestationDeServices && (entrepriseParDefaut.secteur == .Artisanale || entrepriseParDefaut.secteur == .Commerciale) {
            impotLiberatoire = 1.7
        } else if entrepriseParDefaut.typeActivite == .PrestationDeServices || entrepriseParDefaut.secteur == .Liberales {
            impotLiberatoire = 2.2
        }
        return impotLiberatoire
    }

func getCFE() -> Double {
    switch entrepriseParDefaut.secteur {
        case .Artisanale :
            cfe = 0.3
        case .Liberales :
            cfe = 0.2
        default :
            cfe = 0.1
    }
    return cfe
}
func getFraisDeChambre() -> Double {
    switch entrepriseParDefaut.secteur {
        case .Commerciale :
            switch entrepriseParDefaut.typeActivite {
                case .PrestationDeServices :
                    fraisChambre = 0.04
                case .ActiviteDeVente :
                    fraisChambre = 0.02
                default :
                    fraisChambre = 0
            }
        case .Artisanale :
            switch entrepriseParDefaut.typeActivite {
                case .PrestationDeServices :
                    fraisChambre = 0.48
                case .ActiviteDeVente :
                    fraisChambre = 0.22
                default :
                    fraisChambre = 0
            }
        default :
            fraisChambre = 0
    }
    return fraisChambre
}
func getCotisations() -> Double {
    switch entrepriseParDefaut.typeActivite {
        case .ActiviteDeVente :
            cotisations = 12.8
//        case .Liberales :
//            cotisations = 22.2
        case .PrestationDeServices :
            cotisations = 22
        default :
            cotisations = 0 // A VOIR
    }
    if entrepriseParDefaut.secteur == .Liberales {
        cotisations = 22.2
    }
    return cotisations
}
struct PrototypeDeCalcul_Previews: PreviewProvider {
    static var previews: some View {
        PrototypeDeCalculViewModel()
    }
}
