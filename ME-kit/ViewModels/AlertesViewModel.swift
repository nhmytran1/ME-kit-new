//
//  AlertesViewModel.swift
//  ME-kit
//
//  Created by Apprenant 82 on 06/12/2021.
//

import Foundation
import UserNotifications

class notificationManager {
    
    static let instance = notificationManager() // Singleton
    
    // Demande l'autorisation d'envoyer des notifications
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if let error = error {
                print("ERROR \(error)")
            }else {
                print("SUCCES")
            }
        }
        
    }
    
    func notificationExempleAFE() {
        let content = UNMutableNotificationContent()
        content.title = "Achetez des AirPod"
        content.subtitle = "apple.com"
        content.sound = .defaultCritical
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    //Scheduled notification in time, second tto calendar and trigger.
    func scheduledNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was so dope"
        content.sound = .default
        content.badge = 1
        
        // Time
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // 5 seconds before scheduling the request
        
        // Calendar
        var dateComponents = DateComponents()
        
        dateComponents.hour = 14
        dateComponents.minute = 52
//        dateComponents.weekday = 6 // Friday number 6, monday is number two
        // This writing saying every Fryday at 9.27 am I'm notifying the user
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        //Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    // URSSAF trimstriel Notification
    func scheduledNotificationUrssafQuarterly() {
        let content = UNMutableNotificationContent()
        content.title = "This is my Urssaf notification"
        content.subtitle = "I don't want pay for it "
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 44
        dateComponents.weekday = 6 // Friday number 6, monday is number two
        dateComponents.month = 12 / 4 // For quarterly notification
        
        // Ce qui lance la notification à une date, heure, précise
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //Every parameters for send the notification
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        // Send the notification at the moment asked
        UNUserNotificationCenter.current().add(request)
    }
    
    // CFE annuellement
    func scheduledNotificationCfe() {
        
        // Content of my notification
        let content = UNMutableNotificationContent()
        content.title = "Hey ! Il faut que tu fasses ta décaration CFE 😉"
        content.subtitle = "Tu as jusqu'au 15 décembre ! "
        content.sound = .default
        content.badge = 1
        
        
        // dateComponents asked in the trigger for choose when notifying.
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 04
        dateComponents.weekday = 2 // Friday number 6, monday is number two
        dateComponents.month = 10 // For quarterly notification
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduledNotificationImpot() {
        
        // Content of my notification
        let content = UNMutableNotificationContent()
        content.title = "Hey ! Il faut que tu fasses ta décaration d'impot 😉"
        content.subtitle = "Tu as jusqu'au 14 mars, mais ne traine pas ! "
        content.sound = .default
        content.badge = 1
        
        
        // dateComponents asked in the trigger for choose when notifying.
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 04
        dateComponents.weekday = 2 // Friday number 6, monday is number two
        dateComponents.month = 09 // For quarterly notification
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduledNotificationMonthly() {
        
        // Content of my notification
        let content = UNMutableNotificationContent()
        content.title = "Hey ! Il faut que tu fasses ta décaration mensuelle URSSAF"
        content.subtitle = "Tu as jusqu'au 31 décembre ! "
        content.sound = .default
        content.badge = 1
        
        // dateComponents asked in the trigger for choose when notifying.
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 04
        dateComponents.weekday = 2 // Friday number 6, monday is number two
        dateComponents.month = 12 / 12 // For monthly notification
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
