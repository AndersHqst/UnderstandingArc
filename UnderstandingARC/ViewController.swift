//
//  ViewController.swift
//  UnderstandingARC
//
//  Created by Anders Høst Kjærgaard on 07/11/2015.
//  Copyright © 2015 e-conomic International A/S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var person:Human?
    
    @IBAction func createPerson(sender: UIButton) {
        person = Human(name: "andesr")
    }
    
    @IBAction func removePersonRef(sender: UIButton) {
        person = nil
    }
    
    
    var benny:Human?
    @IBAction func createStrongReferenceCycle(sender: UIButton) {
        benny = Human(name: "benny")
        let carsten = Human(name: "carsten")
        benny!.friend = carsten
        carsten.friend = benny
        // Now nil (loose) the reference to the benny
        // and see that the two Human objects are not deinitialized
        // we are taking up memory that we do not use :(
        benny = nil
    }
    
    var dennis:Human?
    @IBAction func demoUnownedRefernces(sender: UIButton) {
        dennis = Human(name: "dennis")
        let arm = HumanArm(human: dennis!)
        dennis!.leftArm = arm
        // Remove ref to dennis again, memory is correctly cleaned
        // eventhoug the Human and HumanArm refer to eachother in 
        // a cyclic manner
        dennis = nil;
    }
}

