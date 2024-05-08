//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

public protocol DataWrapperPublicHandle {
    associatedtype T
 
    var wrappedValue: T { get set }
    
    /// 摩尔质量
    var moleMass: Double { get }
    
   
//    static var unit = UnitConcentrationMass.gramsPerLiter
//    var concentration: Concentration
//
//    public init(moleMass: Double, value: Double, unit: String) {
//        self.moleMass = moleMass
//        self.concentration = Concentration(value: value, unit: Monocase.unit.uString(unit, moleMass))
//    }
    
    init(wrappedValue: T, moleMass: Double)

    init()
    
}

protocol ValueProtocol {
    associatedtype T
    var value: T { get }

}
