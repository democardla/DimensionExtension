//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

/// 摩尔单体
public struct MoleMonocase {
    /// 单体的摩尔质量
    public var moleMass: Double

    /// 称取的该物质的质量
    var value: Double
    
    /// 计量单位
    var unit: UnitMole
    
    /// 质量表达
    public var mole: Mole {
        return Mole(value: value, unit: unit)
    }
}
