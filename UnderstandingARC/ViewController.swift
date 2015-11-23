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
    weak var weakPerson:Human?
    
    @IBAction func createPerson(sender: UIButton) {
        person = Human(name: "anders")
        weakPerson = person
    }
    
    @IBAction func removePersonRef(sender: UIButton) {
        person = nil
        // No need to nil the weakPerson ref
    }
    
    @IBAction func createWeakRefToHuman(sender: UIButton) {
        weakPerson = Human(name: "weak anders")
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
    
    var erik:Human?
    var eriksArm:HumanArm?
    @IBAction func demoUnownedRefernces2(sender: UIButton) {
        erik = Human(name: "erik")
        eriksArm = HumanArm(human: erik!)
        erik!.leftArm = eriksArm
        // Kill erik -> it makes no sense that his arm should be alive...
        erik = nil;
        // Explode!
        print(eriksArm!.human)
    }
}

