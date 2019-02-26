//
//  DesignableView.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {

    
    ///Corner Raduis is a shortcut and inspectable variable for `view.layer.cornerRaduis`
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
                self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    ///Border Width is a shortcut and inspectable variable for `view.layer.borderWidth`
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    ///Border Color is a shortcut and inspectable variable for `view.layer.borderColor`, also it uses the UIColor insted of CGColor
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    
    ///Border Width is a shortcut and inspectable variable for `view.layer.shadowOffset`
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0, height: 0){
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    ///Border Color is a shortcut and inspectable variable for `view.layer.shadowColor`, also it uses the UIColor insted of CGColor
    @IBInspectable public var shadowColor: UIColor = .lightGray {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    
    ///Border Width is a shortcut and inspectable variable for `view.layer.shadowOpacity`
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    ///Border Width is a shortcut and inspectable variable for `view.layer.shadowRadius`
    @IBInspectable public var shadowRaduis: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = self.shadowRaduis
        }
    }
    
}
