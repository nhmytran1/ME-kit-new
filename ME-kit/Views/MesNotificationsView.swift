//
//  MesNotificationsView.swift
//  ME-kit
//
//  Created by Elliot knight on 08/12/2021.
//
import SwiftUI

struct MesNotificationsView: View {
    @State var isNotificationActivated = false
    @State var isNotificationExtendedJury = false
    @State var isUrssafActivated: Bool = false
    @State var isCfeActivated: Bool = false
    @State var isImpotIsActivated: Bool = false
    @State var isQuarterlyDeclarationIsActivated: Bool = false
    
    let scheduledNotifications = notificationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        //Notification permission
                        ToggleView(isOn: $isNotificationActivated, nameOfNotification: isNotificationActivated == true ? "Notifications activées 💼" : "Activer les notifications 🔔")
                            .onChange(of: isNotificationActivated) { isActivated in
                                if isActivated {
                                    scheduledNotifications.requestAuthorization()
                                }
                                //Active tous les boutons si le premier est en on
                                if isNotificationActivated == true {
                                    isNotificationExtendedJury = true
                                    isUrssafActivated = true
                                    isCfeActivated = true
                                    isImpotIsActivated = true
                                    isQuarterlyDeclarationIsActivated = true
                                }else {
                                    // Désactive tous les bouttons si le premier off
                                    isNotificationExtendedJury = false
                                    isUrssafActivated = false
                                    isCfeActivated = false
                                    isImpotIsActivated = false
                                    isQuarterlyDeclarationIsActivated = false
                                }
                            }
                        //Notification AFE Jury
                        ToggleView(isOn: $isNotificationExtendedJury, nameOfNotification: "Jury Final")
                            .onChange(of: isNotificationExtendedJury) { isActivated in
                                if isActivated {
                                    scheduledNotifications.notificationExempleAFE()
                                }
                            }
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
        Group {
            MesNotificationsView()
            MesNotificationsView()
                .preferredColorScheme(.dark)
        }
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

