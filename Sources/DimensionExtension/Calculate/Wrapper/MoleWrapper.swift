//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

/// 摩尔单体
@propertyWrapper
public struct MoleWrapper: DataWrapperPublicHandle {
    public typealias T = Mole
    
    /// 称取的该物质的质量
    public var value: T = T(value: 0, unit: .mole)
    
    /// 质量表达
    public var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
    
    /// 摩尔质量
    public var moleMass: Double


    public init(wrappedValue: T, moleMass: Double) {
          value = wrappedValue
          self.moleMass = moleMass
    }

    public init() {
        moleMass = 0
    }
}
