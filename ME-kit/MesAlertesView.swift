//
//  MesAlertesView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 03/12/2021.
//

import SwiftUI

struct MesAlertesView: View {
//    @Environment(\.dismiss) var dismiss
    @State private var agreedToAlarm = false
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Text("Mes alertes")
                    List(alertes) { a in
                        Text("Github")
                        VStack (alignment: .leading) {
                            Toggle(a.title, isOn: $agreedToAlarm)
                                .font(.headline)
                            Text(a.content)
                            Text(a.date)
                        }
                    }
                    
                    Section {
                        Toggle("Alerte 200", isOn: $agreedToAlarm)
                    }
                    
                    NavigationLink (destination: MesAlertesParamView()) {
                        Image(systemName: "gearshape")
                    }
                    .foregroundColor(Color("greenMEkit"))
                }
                .navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct MesAlertesView_Previews: PreviewProvider {
    static var previews: some View {
        MesAlertesView()
    }
}
