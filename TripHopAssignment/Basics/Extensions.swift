//
//  Extensions.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit


extension CountableClosedRange where Bound == Int {
    var randomValue: Int {
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound)))
    }
}

extension CountableRange where Bound == Int {
    var randomValue: Int {
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound)))
    }
}


extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
