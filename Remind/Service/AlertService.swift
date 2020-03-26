//
//  AlertService.swift
//  Remind
//
//  Created by AHMED on 8/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit


class AlertService {
  
  private init() {}
  
  static func actionSheet(in vc: UIViewController, title: String, completion: @escaping () -> Void){
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let action = UIAlertAction(title: title, style: .default) { (_) in
      completion()
    }
    
    alert.addAction(action)
    vc.present(alert, animated: true)
    
  }
  
}
