//
//  ToggleView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 06/12/2021.
//

import SwiftUI

struct ToggleView: View {
    
    @State var isUrssafActivated: Bool = true
    @State var isCfeActivated: Bool = true
    @State var isImpotIsActivated: Bool = true
    
    let scheduledNotifications = notificationManager()

    var body: some View {
                
        VStack {
            Form {
                Section {
                    Toggle(isOn: $isUrssafActivated) {
                        Text("Urssaf")
                    }
                    .onChange(of: isUrssafActivated) { isActivated in
                        if isActivated {
                            scheduledNotifications.scheduledNotificationUrssafQuarterly()
                        }
                    }
                    Toggle(isOn: $isCfeActivated) {
                        Text("CFE")
                    }
                    .onChange(of: isCfeActivated) { isActivated in
                        if isActivated {
                            scheduledNotifications.scheduledNotificationCfe()
                        }
                    }
                }.toggleStyle(SwitchToggleStyle(tint: Color.blue))
            }
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
