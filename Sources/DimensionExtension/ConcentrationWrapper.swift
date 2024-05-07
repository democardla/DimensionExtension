//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

@propertyWrapper
struct ConcentrationWrapper {
    
    public var moleMass: Double
    
    var wrappedValue: Concentration
    
}


