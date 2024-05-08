//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation


/// 该类实现一个带有摩尔质量属性的单体
/// 
/// - Parameter
///     |Parameter|Description|
///     |-|-|
///     |``moleMass``|单体的摩尔质量|
///     |``value``|称取的该物质的质量|
///     |``unit``|计量单位|
@propertyWrapper
public struct MassWrapper {
    public var wrappedValue: Mass {
        get { mass }
        set { mass = newValue }
    }
    
    /// 摩尔质量
    public var moleMass: Double
    
//    /// 称取的该物质的质量
//    var value: Double
//    
//    /// 计量单位
//    var unit: UnitMass
    
    /// 质量表达
    public var mass: Mass = Mass(value: 0, unit: .grams)
//    {
//        return Mass(value: value, unit: unit)
//    }
    
//    static var unit = UnitConcentrationMass.gramsPerLiter
//    var concentration: Concentration
//    
//    public init(moleMass: Double, value: Double, unit: String) {
//        self.moleMass = moleMass
//        self.concentration = Concentration(value: value, unit: Monocase.unit.uString(unit, moleMass))
//    }
    
    public init(wrappedValue: Mass, moleMass: Double) {
        self.moleMass = moleMass
        mass = wrappedValue
    }

    public init() {
        moleMass = 0
    }
    
}
