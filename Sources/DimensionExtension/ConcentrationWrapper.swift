//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

@propertyWrapper
struct ConcentrationWrapper{
    public var moleMass: Double
    
    var wrappedValue: Concentration
    
    private var moleC: [String] {
        return type(of: wrappedValue.unit).moleC
    }
    private var massC: [String] {
        return type(of: wrappedValue.unit).massC
    }
    private var timeC: [String] {
        return ["X"]
    }
    
    /// 当前单位符号集
    private var currentC: [String] {
        let symbol = wrappedValue.unit.symbol
        if moleC.contains(symbol) {
            return moleC
        } else if massC.contains(symbol) {
            return massC
        }
        
        return timeC
    }
    
    public mutating func convert(to: String){
        wrappedValue.convert(to: to)
    }
    
}


