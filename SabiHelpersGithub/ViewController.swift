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
        
        let from: CGFloat = -30
        let to: CGFloat = 80
        let howMany = Helper.randomBetween(10, max: 10000, includeMax: true)
        
        let rotator = GenericCGFloatRotator(
            rotateValue: Helper.random01(),
            from: from,
            to: to,
            extraInfoHowMany: howMany,
            modifyValue: true
        )
        
        print("From: \(from)")
        print("To: \(to)")
        print("N-times: \(howMany)")
        
        var allValues = String()
        
        for _ in 0 ... 1000
        {
            let rotated = rotator.rotate()
            allValues = "\(allValues)\n\(rotated)"
            print(rotated)
        }
        
        valuesTextView.text = allValues
        
        print("---")
        print("---")
        print("---")
        
    }
    
}

