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
///     - ``moleMass``: 单体的摩尔质量
///     - ``value``: 称取的该物质的质量
///     - ``unit``: 计量单位
public struct Monocase {
    
    /// 单体的摩尔质量
    public var moleMass: Double
    
    /// 称取的该物质的质量
    var value: Double
    
    /// 计量单位
    var unit: UnitMass
    
    /// 质量表达
    public var mass: Mass {
        return Mass(value: value, unit: unit)
    }
    
//    static var unit = UnitConcentrationMass.gramsPerLiter
//    var concentration: Concentration
//    
//    public init(moleMass: Double, value: Double, unit: String) {
//        self.moleMass = moleMass
//        self.concentration = Concentration(value: value, unit: Monocase.unit.uString(unit, moleMass))
//    }
    
}
