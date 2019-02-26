//
//  Manager.swift
//  TripHopAssignment
//
//  Created by Ahmed Qazzaz on 2/26/19.
//  Copyright © 2019 Ahmed Qazzaz. All rights reserved.
//

import UIKit

class Manager: NSObject {
    
    static let shared = Manager.init()
    let modelsManager = HotelsGenerator.init()
    
    private override init() {
        //Anything should happen once in the app should goes here ...
    }
    
}







