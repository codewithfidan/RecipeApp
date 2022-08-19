//
//  Rational.swift
//  RecipeListApp
//
//  Created by Fidan Oruc on 19.08.22.
//

import Foundation

struct Rational{
    
    static func greatestCommonDivisor(a: Int, b: Int) -> Int{
        
        // // GCD(0, b) = b
        if a == 0{return b}
        
        // GCD(a, 0) = a
        if b == 0{return a}
        
        // Otherwise, GCD(a, b) = GCD(b, remainder)
        return greatestCommonDivisor(a: b, b: a%b)
    }
}
