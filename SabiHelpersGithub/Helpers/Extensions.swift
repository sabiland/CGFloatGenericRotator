//
//  Extensions.swift
//  Facex
//
//  Created by Marko Sabotin on 20/08/16.
//  Copyright © 2016 Marko Sabotin. All rights reserved.
//

import UIKit

extension CGFloat {
    
    mutating func scroll(from: CGFloat, to: CGFloat, factor: inout CGFloat)
    {
        let temp = self + factor
        
        if temp > to
        {
            // NOTE: !!! REVERSE FACTOR
            self = to
            factor.reverse()
        }
        else if temp < from
        {
            // NOTE: !!! REVERSE FACTOR
            self = from
            factor.reverse()
        }
        else
        {
            self = temp
        }
    }
    
    // NOTE: Multiply by -1
    mutating func reverse()
    {
        self = self * -1
    }
    
}
