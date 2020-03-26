//
//  ShadowView.swift
//  Remind
//
//  Created by AHMED on 8/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class ShadowView: UIView {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 1, height: 1)
    layer.shadowOpacity = 1
    layer.shadowOpacity = 5
    layer.cornerRadius = 5
    
  }

}
