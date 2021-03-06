//
//  Helper.swift
//  SabiHelpersGithub
//
//  Created by Marko Sabotin on 03/12/2018.
//  Copyright © 2018 Marko Sabotin. All rights reserved.
//

import UIKit

final class Helper {
    
    static func runAsyncMain(_ block: @escaping () -> Void)
    {
        DispatchQueue.main.async {
            block()
        }
    }
    
    static func randomFifty(action: () -> Void)
    {
        if randomFifty()
        {
            action()
        }
    }
    
    static func randomFifty() -> Bool
    {
        return random01() < 0.5
    }
    
    static func random01() -> CGFloat
    {
        return CGFloat(drand48())
    }
    
    static func randomBetween(_ min: Int, max: Int, includeMax: Bool = false) -> Int
    {
        var tempMax:Int = max
        
        // NOTE: !!! SPECIAL CASE, THIS MUST BE THIS WAY - SO SELECTING RANDOM NUMBER OF 1-LENGTH ARRAY WOULD WORK!
        if min == tempMax
        {
            return min
        }
        
        if tempMax <= min
        {
            tempMax = min + 1
        }
        
        if includeMax
        {
            tempMax += 1
        }
        
        return randomBetween(min: UInt32(min), max: UInt32(tempMax))
    }
    
    private static func randomBetween(min: UInt32, max: UInt32) -> Int
    {
        var r:Int = Int(min) + ((Helper.randomInt() % Int(max - min)))
        
        if r < Int(min)
        {
            r = Int(min)
        }
        else if r > Int(max)
        {
            r = Int(max)
        }
        
        return r;
    }
    
    static func randomMinAddMax(_ min: CGFloat, max: CGFloat) -> CGFloat
    {
        return min + random01Max(max)
    }
    
    static func random01Max(_ max: CGFloat) -> CGFloat
    {
        return max * random01()
    }
    
    static func randomInt(max: Int? = nil) -> Int
    {
        var rint: Int = 0
        
        if let m = max
        {
            rint = Int(random01() * CGFloat(m))
        }
        else
        {
            rint = Int(random01() * CGFloat(UInt32.max))
        }
        
        return rint
    }
    
    static func randomOneOrMinusOne() -> CGFloat
    {
        return randomFifty() ? 1 : -1
    }
    
}
