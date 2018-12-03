//
//  GenericCGFloatRotator.swift
//  pixelator
//
//  Created by Marko Sabotin on 02/12/2018.
//  Copyright © 2018 Marko Sabotin. All rights reserved.
//

import UIKit

final class GenericCGFloatRotator {
    
    private let modifyValue: Bool
    private let from: CGFloat
    private let to: CGFloat
    private let extraInfoHowMany: Int
    
    private var valueModifier: CGFloat = 0
    private var rotateValue: CGFloat
    
    // NOTE: Init with from == 0 && to == 1
    // NOTE: Init with from == 0 && to == 1
    // NOTE: Init with from == 0 && to == 1
    convenience init (rotateValue: CGFloat, extraInfoHowMany: Int, modifyValue: Bool)
    {
        self.init(rotateValue: rotateValue, from: 0, to: 1, extraInfoHowMany: extraInfoHowMany, modifyValue: modifyValue)
    }
    
    init(rotateValue: CGFloat, from: CGFloat, to: CGFloat, extraInfoHowMany: Int, modifyValue: Bool)
    {
        assert(to > from, "'to' MUST be > 'from'")
        
        self.rotateValue = rotateValue
        self.from = from
        self.to = to
        self.extraInfoHowMany = extraInfoHowMany
        self.modifyValue = modifyValue
        
        // SETUP
        // SETUP
        // SETUP
        setupRotator()
    }
    
    private func setupRotator()
    {
        var variationFactor: Int = extraInfoHowMany
        
        Helper.randomFifty {
            variationFactor = Int(sqrt(CGFloat(variationFactor)))
        }
        
        // NOTE: Divisor must start from AT LEAST 1 -> So we do not get Zero division
        // NOTE: Divisor must start from AT LEAST 1 -> So we do not get Zero division
        // NOTE: Divisor must start from AT LEAST 1 -> So we do not get Zero division
        // Set value modifier
        valueModifier = 1 / CGFloat(Helper.randomBetween(1, max: variationFactor, includeMax: true))
        
        // Random up/down start
        valueModifier *= Helper.randomOneOrMinusOne()
    }
    
    @discardableResult func rotate() -> CGFloat
    {
        if modifyValue
        {
            rotateValue.scroll(from: from, to: to, factor: &valueModifier)
        }
        return rotateValue
    }
    
    
}
