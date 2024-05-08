//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

// MARK: 对`UnitVolume`的扩展
extension UnitVolume {
    /// uL
    public class var micorliter: UnitVolume {
        return getCustomUnit(coefficient: .thousand(-2), symbol: "uL")
    }
    
    /// 立方厘米
    public class var cubicCentimeters: UnitVolume {
        return getCustomUnit(coefficient: .thousand(-1), symbol: "cm³")
    }
    
}
