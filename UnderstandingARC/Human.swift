//
//  Person.swift
//  UnderstandingARC
//
//  Created by Anders Høst Kjærgaard on 07/11/2015.
//  Copyright © 2015 e-conomic International A/S. All rights reserved.
//

import UIKit

class Human: NSObject {
    
    var friend:Human?
    
    // Strong referen to his arm
    // if the human is alive, and has a no-nil arm, it is alive
    var leftArm:HumanArm?
    
    // Name of the human to make console output more readable
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
    override var description: String {
        return name
    }
}
