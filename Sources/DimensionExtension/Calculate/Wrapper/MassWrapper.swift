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
@propertyWrapper
public struct MassWrapper: DataWrapperPublicHandle {
    /// 质量表达
    public var value: Mass = Mass(value: 0, unit: .grams)
 
    public var wrappedValue: Mass {
        get { value }
        set { value = newValue }
    }
    
    /// 摩尔质量
    public var moleMass: Double
    
    public init(wrappedValue: Mass, moleMass: Double) {
        self.moleMass = moleMass
        value = wrappedValue
    }
    
    public init(moleMass: Double, value: Double, unit: String) {
        let wrappedValue = Mass(value: value, unit: UnitMass.grams.uString(unit))
        self.init(wrappedValue: wrappedValue, moleMass: moleMass)
    }

    public init() {
        moleMass = 0
    }
    
}
