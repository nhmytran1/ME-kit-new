//
//  MesNotificationsView.swift
//  ME-kit
//
//  Created by Elliot knight on 08/12/2021.
//
import SwiftUI

struct MesNotificationsView: View {
    
    @State var isUrssafActivated: Bool = true
    @State var isCfeActivated: Bool = true
    @State var isImpotIsActivated: Bool = true
    @State var isQuarterlyDeclarationIsActivated: Bool = true

    let scheduledNotifications = notificationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                            //URSSAF toggle notification
                            ToggleView( isOn: $isUrssafActivated, nameOfNotification: "Déclaration trimstrielle URSSAF")
                        .onChange(of: isUrssafActivated) { isActivated in
                            if isActivated {
                                scheduledNotifications.scheduledNotificationUrssafQuarterly()
                            }
                        }
    
                        // CFE toggle notification
                        ToggleView(isOn: $isCfeActivated, nameOfNotification: "CFE")
                        
                            .onChange(of: isCfeActivated) { isActivated in
                                if isActivated {
                                    scheduledNotifications.scheduledNotificationCfe()
                                }
                            }
                      
                        // Impot toggle notification
                        ToggleView(isOn: $isImpotIsActivated, nameOfNotification: "Impot annuel")
                    .onChange(of: isImpotIsActivated) { isActivated in
                        if isActivated {
                            scheduledNotifications.scheduledNotificationImpot()
                            print("Notification impot activée")
                        } else {
                            print("Notification impot désactivée")
                        }
                    }
                        // URSSAF
                        ToggleView(isOn: $isQuarterlyDeclarationIsActivated, nameOfNotification: "Déclaration mensuelle URSSAF") }
                    .onChange(of: isQuarterlyDeclarationIsActivated) { isActivated in
                        if isActivated {
                            scheduledNotifications.scheduledNotificationMonthly()
                        }
                    }.toggleStyle(SwitchToggleStyle(tint: Color("greenMEkit")))
                }
            }.navigationTitle("Notifications")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MesNotifications_Previews: PreviewProvider {
    static var previews: some View {
        MesNotificationsView()
    }
}

struct ToggleView: View {
    
    @Binding var isOn: Bool
    let nameOfNotification: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(nameOfNotification)
        }
    }
}

