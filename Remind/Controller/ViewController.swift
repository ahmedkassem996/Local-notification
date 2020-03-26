//
//  ViewController.swift
//  Remind
//
//  Created by AHMED on 8/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UNService.shared.authorize()
    
  }
  
  @IBAction func onTimerTapped(){
    print("timer")
    
    AlertService.actionSheet(in: self, title: "5 seconds") {
      UNService.shared.timerRequest(with: 5)
    }
  }
  
  @IBAction func onDateTapped(){
    print("date")
    
    AlertService.actionSheet(in: self, title: "Some future time") {
      var components = DateComponents()
      components.second = 0
      
      UNService.shared.dateRequest(with: components)
    }
  }
  
  @IBAction func onLocationTapped(){
    print("location")
    
    AlertService.actionSheet(in: self, title: "When i return") {
      
    }
  }


}

