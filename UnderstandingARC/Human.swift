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
    // weak references, i.e. reference to things that may have no value
    // must be optional
    weak var weakFriend:Human?
    var leftArm:HumanArm?
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
