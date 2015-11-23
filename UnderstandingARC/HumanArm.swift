//
//  HumanArm.swift
//  UnderstandingARC
//
//  Created by Anders Høst Kjærgaard on 07/11/2015.
//  Copyright © 2015 e-conomic International A/S. All rights reserved.
//

import UIKit

class HumanArm: NSObject {
    
    // A HumanArm connot exist without a Human
    // But a Human can exist without an HumanArm
    unowned var human:Human
    
    let armName:String
    
    init(human: Human) {
        self.human = human
        self.armName = self.human.name + "'s arm"
        print("Initialized \(self.human.name)'s arm")
    }
    
    deinit {
        print("Deinitialized \(armName)")        
        // Do not access the human here, as it may have been deallocated
//        print("Crash? \(human)")
    }
}
