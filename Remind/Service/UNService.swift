//
//  UNService.swift
//  Remind
//
//  Created by AHMED on 8/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import Foundation
import UserNotifications

class UNService: NSObject{
  
  private override init() {}
  static let shared = UNService()
  
  let unCenter = UNUserNotificationCenter.current()
  
  func authorize() {
    let options: UNAuthorizationOptions = [.alert, .badge, .sound, .carPlay]
    unCenter.requestAuthorization(options: options) { (granted, error) in
      print(error ?? "NO UN AUTH ERROR")
      guard granted else {
        print("PRINT USER DENIED ACCESSs")
        return
      }
      
      self.configure()
      
    }
  }
  
  func configure(){
    unCenter.delegate = self
  }
  
  func timerRequest(with interval: TimeInterval){
    let content = UNMutableNotificationContent()
    content.title = "Timer Finished"
    content.body = "Your timer is all done. YAY!"
    content.sound = .default
    content.badge = 1
    
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
    let requset = UNNotificationRequest(identifier: "userNotification.timer", content: content, trigger: trigger)
    
    unCenter.add(requset)
  }
  
  func dateRequest(with components: DateComponents){
    let content = UNMutableNotificationContent()
    content.title = "Date Trigger"
    content.body = "It is now the future!"
    content.sound = .default
    content.badge = 1
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
    let request = UNNotificationRequest(identifier: "userNotification.date", content: content, trigger: trigger)
    
    unCenter.add(request)
  }
  
}

extension UNService: UNUserNotificationCenterDelegate{
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    print("UN did recive response")
    
    completionHandler()
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    print("UN will present")
    
    let options: UNNotificationPresentationOptions = [.alert, .sound]
    
    completionHandler(options)
  }
}
