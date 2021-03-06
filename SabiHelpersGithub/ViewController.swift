//
//  ViewController.swift
//  SabiHelpersGithub
//
//  Created by Marko Sabotin on 03/12/2018.
//  Copyright © 2018 Marko Sabotin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valuesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupStart()
    }
    
    private func setupStart()
    {
        let seed:Int = Int(arc4random_uniform(UInt32(Int32.max)))
        // SET random SEED !!!
        srand48(seed)
    }
    
    @IBAction func makeRotation(_ sender: Any) {
        
        let from: CGFloat = 0
        let to: CGFloat = 1
        let extraInfoHowMany = Helper.randomBetween(10, max: 1000, includeMax: true)
        
        let rotator = GenericCGFloatRotator(
            rotateValue: Helper.randomMinAddMax(from, max: (to - from)),    // Initial value
            from: from,
            to: to,
            extraInfoHowMany: extraInfoHowMany,
            modifyValue: true   // If false, initial value 'rotateValue' will be FIXED
        )
        
        print("From: \(from)")
        print("To: \(to)")
        print("ExtraInfoHowMany: \(extraInfoHowMany)")
        
        var allValues = String()
        
        for _ in 0 ... 1000
        {
            let rotated = rotator.rotate()  // ROTATE -> get new value
            allValues = "\(allValues)\n\(rotated)"
            print(rotated)
        }
        
        print("---")
        print("---")
        print("---")
        
        Helper.runAsyncMain {
            self.valuesTextView.text = allValues
            self.valuesTextView.setContentOffset(.zero, animated: true)
        }
        
    }
    
}

