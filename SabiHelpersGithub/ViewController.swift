//
//  ViewController.swift
//  SabiHelpersGithub
//
//  Created by Marko Sabotin on 03/12/2018.
//  Copyright © 2018 Marko Sabotin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupStart()
    }
    
    private func setupStart()
    {
        
        
    }
    
    @IBAction func makeRotation(_ sender: Any) {
        
        let from: CGFloat = 0
        let to: CGFloat = 1
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
        
        for _ in 0 ... 1000
        {
            print(rotator.rotate())
        }
        
        print("---")
        print("---")
        print("---")
        
    }
    
}

